class CreateBreaks < ActiveRecord::Migration[7.0]
  def change
    create_table :breaks do |t|
      t.references :time_record, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
