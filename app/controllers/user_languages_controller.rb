class UserLanguagesController < ApplicationController
    before_action :find_user_language, only: [:show, :destroy]
  
    
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @user_languages = User.find_by_id(params[:user_id]).user_languages
        else
        @user_languages = UserLanguage.all
        end
        if params[:q]
             @user_languages = UserLanguage.search(params[:q].capitalize)
            
        end
    end


    def show
    
    end

    def new 
        
        
        if logged_in? && params[:user_id].to_i == current_user.id
            
            find_user
            @user_language = @user.user_languages.build   
        else
            flash[:alert] = "You do not have access to this page!"
            
            redirect_to user_languages_path   
        end

    end
    


    def create
        @user_language = UserLanguage.new(user_language_params)
        
            if @user_language.save
                redirect_to user_language_path(@user_language)    #  /user/:id
            else
                render :new
            end   
    end


    def edit
        if logged_in? && UserLanguage.find_by(id: params[:id]).user.id == current_user.id
            
            user = UserLanguage.find_by(id: params[:id]).user
            @user_language = user.user_languages.find_by(id: params[:id])
        else
            flash[:alert] = "You do not have access to this page!"
            redirect_to user_languages_path
        end
      end 


    def update
        @user_language = UserLanguage.find(params[:id])
            
            if @user_language.update(user_language_params)
                redirect_to user_language_path(@user_language) 
            else
                render :edit
            end 
    end

        def destroy
            @user_language.destroy
            redirect_to user_languages_path
        end
    
    
    private

    def find_user
     @user = User.find_by_id(params[:user_id])
    end

    def find_user_language
        @user_language = UserLanguage.find_by_id(params[:id])
    end


    def user_language_params
        params.require(:user_language).permit(:learned, :learn_next, :review, :user_id, :language_id, :enjoying, :time_spent  )
    end 

   
end
