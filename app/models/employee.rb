class Employee < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :busies
end
