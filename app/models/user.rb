class User < ApplicationRecord
    has_secure_password
    
    has_many :user_languages
    has_many :languages, through: :user_languages


    validates :username, presence: true, uniqueness: true 
end
