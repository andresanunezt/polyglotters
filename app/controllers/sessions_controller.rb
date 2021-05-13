class SessionsController < ApplicationController
    
    def new
        if logged_in?
            redirect_to user_languages_path
        end

    end


    def create
        @user = User.find_by(username: params[:username])
        
    if  @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
    else
        redirect_to login_path        #  redirect_to login_path
     end
    
    end


    def destroy
     
        if logged_in? 
            session.clear
            redirect_to login_path
        else
            redirect_to user_language_path
        end
    end
      

 
end