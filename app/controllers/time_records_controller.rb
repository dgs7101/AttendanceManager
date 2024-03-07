class TimeRecordsController < ApplicationController
    before_action :authenticate_user!

    def index
        # 今日の日付でのレコードを降順に取得
        @time_records = current_user.time_records.where("check_in >= ?", Time.zone.today.beginning_of_day).order(check_in: :desc)
    end
        
    def check_in
        @time_record = current_user.time_records.create(check_in: Time.current)
        if @time_record.save
            redirect_to time_records_path, notice: '出勤時刻を記録しました。'
        else
            redirect_to time_records_path, alert: '出勤時刻の記録に失敗しました。'
        end
    end
    
    def check_out
        # 最後の出勤記録を取得
        @time_record = current_user.time_records.where.not(check_in: nil).where(check_out: nil).order(check_in: :desc).first
        # 出勤記録があり、退勤記録がない場合のみ退勤時刻を記録
        if @time_record.present?
            if @time_record.update(check_out: Time.current)
                redirect_to time_records_path, notice: '退勤時刻を記録しました。'
            else
                redirect_to time_records_path, alert: '退勤時刻の記録に失敗しました。'
            end
        else
            redirect_to time_records_path, alert: '出勤記録がないか、すでに退勤記録があります。' 
        end
    end

    def show
    end

    def new
        @time_record = current_user.time_records.build
    end

    def edit
    end

    def create
        @time_record = current_user.time_records.build(time_record_params)
        if @time_record.save
            redirect_to @time_record, notice: 'Time record was successfully created.'
        else
            render :new
        end
    end

    def update
        if @time_record.update(time_record_params)
            redirect_to @time_record, notice: 'Time record was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @time_record = current_user.time_records.find(params[:id])
        @time_record.destroy
        redirect_to time_records_url, notice: 'Time record was successfully destroyed.'
    end

    
    private
        def time_record_params
            params.require(:time_record).permit(:check_in, :check_out)
        end
end
