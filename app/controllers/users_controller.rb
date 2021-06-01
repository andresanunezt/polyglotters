class UsersController < ApplicationController
    before_action :find_user, only: [:show]

    def index
      
        @users = User.all
    end
            
        
    def new
        if !logged_in?
        @user = User.new
        else
            redirect_to user_path(current_user.id)
        end
    end

    def show 

    end

    def create
        
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
             
                redirect_to user_path(@user)    
            else
                render :new
            end
    end

   
            


    private
    
    def find_user
        @user = User.find_by_id(params[:id])
    end

        def user_params
            params.require(:user).permit(:name, :username, :email, :password )

        end


end
