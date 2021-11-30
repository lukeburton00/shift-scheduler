class ChangeEndtimeToBeDatetimeInBusies < ActiveRecord::Migration[6.1]
  def change
    change_column :busies, :start_time, :datetime
  end
end
