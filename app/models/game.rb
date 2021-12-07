class Game < ApplicationRecord

    validates :host, presence: true
    validates :date, presence: true
    validates :location, presence: true 
    validates :max_players, presence: true
    validates :sport, presence: true

    has_many :participants, dependent: :destroy
    has_many :users, through: :participants
    belongs_to :host, class_name: "User", foreign_key: 'host_id'


end
