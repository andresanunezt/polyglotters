class StaticController < ApplicationController
    
    def home

        @latest_language = Language.joins(:user_languages).order(:name).last
        
    end
    
    
end
