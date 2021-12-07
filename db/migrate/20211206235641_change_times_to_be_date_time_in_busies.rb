class ChangeTimesToBeDateTimeInBusies < ActiveRecord::Migration[6.1]
  def change
    change_column :busies, :end_time, :datetime
    change_column :busies, :start_time, :datetime
  end
end
