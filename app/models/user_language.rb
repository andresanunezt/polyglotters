class UserLanguage < ApplicationRecord
    belongs_to :user
    belongs_to :language

    validates :goals, :why_learn, :user_id, :language_id, presence: true


    def self.search(params)
       
        ul_search = Language.find_by(name: params)
        
        # binding.pry
        
        if ul_search.nil?
            UserLanguage.order(:created_at)
            
        # ul_search_id = ul_search.ids[0]
        else
        
            UserLanguage.where("language_id = ?", ul_search.id )

        end
       
        
    end


    scope :last_5, -> { order(:created_at).reverse_order.limit(5) } 
    
    
end
