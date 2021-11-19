class BusyTime < ApplicationRecord
    belongs_to :employee, dependent: :destroy
end
