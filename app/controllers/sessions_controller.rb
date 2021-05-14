class SessionsController < ApplicationController
    
    def omniauth  
       binding.pry
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            # user.name =
            redirect_to user_languages_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to login_path
        end
    end
   
    
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

   
      

    private
    def auth
        request.env['omniauth.auth']
    end

 
end