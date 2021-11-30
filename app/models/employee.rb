class Employee < ApplicationRecord
    belongs_to :user
    has_many :busies, dependent: :destroy
end
