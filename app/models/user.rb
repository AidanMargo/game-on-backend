class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :city, presence: true
    validates :age, numericality: { greater_than: 17, only_integer: true }
    validates :email, presence: true

    has_many :participants
    has_many :games, through: :participants
    has_many :hosted_games, class_name: "Game", foreign_key: 'host_id'
end
