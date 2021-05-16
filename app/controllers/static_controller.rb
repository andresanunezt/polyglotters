class StaticController < ApplicationController
    
    def home

        @most_spoken_language = Language.where("number_of_speakers").max

        
    end
    
    
end
