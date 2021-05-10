class User < ApplicationRecord
    has_many :user_languages
    has_many :languages, through: :user_languages
end
