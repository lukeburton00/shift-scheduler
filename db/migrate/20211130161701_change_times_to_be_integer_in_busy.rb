class ChangeTimesToBeIntegerInBusy < ActiveRecord::Migration[6.1]
  def up
    change_column :busies, :start_time, :integer
    change_column :busies, :end_time, :integer

  end

  def down
    change_column :busies, :start_time, :integer
    change_column :busies, :end_time, :integer
  end
end
