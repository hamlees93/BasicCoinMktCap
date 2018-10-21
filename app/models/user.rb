class User < ApplicationRecord
    has_many :coin_users
    has_many :coins, through: :coin_users
end
