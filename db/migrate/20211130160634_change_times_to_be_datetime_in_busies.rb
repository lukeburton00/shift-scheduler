class ChangeTimesToBeDatetimeInBusies < ActiveRecord::Migration[6.1]
  def up
    change_column :busies, :start_time, :datetime
    change_column :busies, :end_time, :datetime

  end

  def down
    change_column :busies, :start_time, :datetime
    change_column :busies, :end_time, :datetime
  end
end
