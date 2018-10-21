class Coin < ApplicationRecord
    include Cryptocurrency
    
    has_many :coin_users
    has_many :users, through: :coin_users
end
