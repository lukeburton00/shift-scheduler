class AddForeignKeyToBusy < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :busies, :employees
  end
end
