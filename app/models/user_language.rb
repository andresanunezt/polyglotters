class UserLanguage < ApplicationRecord
    belongs_to :user
    belongs_to :language

    validates :goals, :why_learn, :user_id, :language_id, presence: true


    def self.search(params)

    end


    scope :last_5, -> { order(:created_at).reverse_order.limit(5) } 
    
    
end
