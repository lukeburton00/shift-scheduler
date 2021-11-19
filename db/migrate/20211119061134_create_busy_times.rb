class CreateBusyTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :busy_times do |t|
      t.integer :employee_id
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
