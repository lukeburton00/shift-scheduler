class CreateBusytimes < ActiveRecord::Migration[6.1]
  def change
    create_table :busytimes do |t|
      t.integer :employee_id
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
    add_index :busytimes, :employee_id
  end
end
