class UserLanguagesController < ApplicationController
    before_action :find_user_language, only: [:show]
    def index
        @user_languages = UserLanguage.all
    end


    def show
    end



    def find_user_language
        @user_language = UserLanguage.find_by_id(params[:id])
    end
end
