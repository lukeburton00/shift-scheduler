class ChangeEndtimeToBeDatetimeInBusies < ActiveRecord::Migration[6.1]
  def change
    change_column :busies, :end_time, :datetime
  end
end
