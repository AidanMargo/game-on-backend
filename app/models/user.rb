class User < ApplicationRecord
    has_secure_password
    validates :

    has_many :participants
    has_many :games, through: :participants
    has_many :hosted_games, class_name: "Game", foreign_key: 'host_id'
end
