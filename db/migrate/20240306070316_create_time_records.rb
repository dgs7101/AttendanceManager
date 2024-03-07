class CreateTimeRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :time_records do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
