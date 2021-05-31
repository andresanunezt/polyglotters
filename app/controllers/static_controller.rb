class StaticController < ApplicationController
    
    def home

        @latest_user_languages = UserLanguage.last_5
    end
    
    
end
