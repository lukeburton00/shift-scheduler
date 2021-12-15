class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.text :first_name
      t.text :last_name
      t.text :phone

      t.timestamps
    end
  end
end
