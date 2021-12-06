class Game < ApplicationRecord
    has_many :participants
    has_many :users, through: :participants
    belongs_to :host, class_name: "User", foreign_key: 'host_id'
end
