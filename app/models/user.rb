class User < ApplicationRecord
    
    has_secure_password

    validates :name, presence: true
    validates :city, presence: true
    validates :age, numericality: { greater_than: 17, only_integer: true }
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :participants
    has_many :games, through: :participants
    has_many :hosted_games, class_name: "Game", foreign_key: 'host_id'

    # def password=(new_password)
    #     salt = BCrypt::Engine::generate_salt
    #     self.password_digest = BCrypt::Engine::hash_secret(new_password, salt)
    # end

    # def authenticate(password)
    #     salt = password_digest[0..28]
    #     return nil unless BCrypt::Engine::hash_secret(password, salt) == self.password_digest
    #     self
    # end

end
