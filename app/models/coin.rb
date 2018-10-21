class Coin < ApplicationRecord
    has_many :coin_users
    has_many :users, through: :coin_users
end
