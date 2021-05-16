class StaticController < ApplicationController
    
    def home

        @latest_languages = Language.order(:created_at).reverse_order.limit(5)

        
    end
    
    
end
