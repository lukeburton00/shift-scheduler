class CreateBusies < ActiveRecord::Migration[6.1]
  def change
    create_table :busies do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :employee_id

      t.timestamps
    end
  end
end
