class Portfolio < ApplicationRecord
    belongs_to :user, optional: true
    validates :symbol, length: { in: 3..4, message: "%{value} is not a valid size. Must be 3 or 4 characters" }
    validates :quantity, presence: true
end
