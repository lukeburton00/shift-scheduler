class CreateBusies < ActiveRecord::Migration[6.1]
  def change
    create_table :busies do |t|
      t.integer :start_time
      t.integer :end_time
      t.integer :employee_id

      t.timestamps
    end
  end
end
