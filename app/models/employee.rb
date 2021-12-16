class Employee < ApplicationRecord
    belongs_to :user
    has_many :busies, dependent: :destroy

    validates :phone, format: {with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "Invalid phone number. Format is 000-000-0000"}
end
