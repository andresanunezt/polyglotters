class User < ApplicationRecord
    has_secure_password
    
    has_many :user_languages
    has_many :languages, through: :user_languages


    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    
    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['email']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end
