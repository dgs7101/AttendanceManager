class AddWorkedSecondsToTimeRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :time_records, :worked_seconds, :integer
  end
end
