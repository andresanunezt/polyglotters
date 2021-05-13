class UserLanguagesController < ApplicationController
    before_action :find_user_language, only: [:show, :destroy]
  
    
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @user_languages = User.find_by_id(params[:user_id]).user_languages
            
        else
        @user_languages = UserLanguage.all
        end
    end


    def show
    
    end

    def new 
        
        # if logged_in? && params[:user_id] == current_user.id
        if logged_in? && params[:user_id].to_i == current_user.id
            
            
            # if params[:user_id] == current_user.id
            find_user
            @user_language = @user.user_languages.build
           
            
        else
        #  @user_language = UserLanguage.new
        # binding.pry
        flash[:alert] = "You do not have access to this page!"
        redirect_to user_languages_path
            
        end

    end
    
    # def new
        
    #     if logged_in? && params[:user_id] = current_user.id
    #         find_user
    #         @user_language = @user.user_languages.build
    #     else
    #     #  @user_language = UserLanguage.new
    #         redirect_to user_languages_path, alert: "you do not have permission"
            
    #     end

    # end


    def create
        @user_language = UserLanguage.new(user_language_params)
        
            if @user_language.save
                redirect_to user_language_path(@user_language)    #  /user/:id
            else
                render :new

            end   
    end


    def edit
        #  if logged_in? params[:user_id]
        if logged_in? && UserLanguage.find_by(id: params[:id]).user.id == current_user.id
          user = UserLanguage.find_by(id: params[:id]).user
            

            @user_language = user.user_languages.find_by(id: params[:id])
        
        else
          
        redirect_to user_languages_path
        
        end
      end 

    #   def edit
    #     # if params[:user_id]
    #     if logged_in? && params[:user_id] = current_user.id
    #       user = User.find_by(id: params[:user_id])
    #       if user.nil?
    #         r
    # edirect_to user_languages_path, alert: "user not found."
    #       else
    #         @user_language = user.user_languages.find_by(id: params[:id])
    #         redirect_to user_languages_path, alert: "user language found." if @user_language.nil?
    #       end
    #     else
    #     #   @user_language = UserLanguage.find(params[:user_id])
    #     redirect_to user_languages_path, alert: "You don't have permission to do this!"
    #     end
    #   end 

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
        params.require(:user_language).permit(:why_learn, :goals,  :user_id, :language_id, :enjoying, :time_spent   
    
        )
    end 

   
end
