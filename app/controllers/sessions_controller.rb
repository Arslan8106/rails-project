class SessionsController < ApplicationController

    def new

    end

    def create
     
        user = User.find_by(email: params[:session][:email])
        respond_to do |format|
        if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           format.html{redirect_to users_path(user), notice: "You have successfully logged in." } 
        else
          format.html{render :new, notice:"Wrong email or password" } 
        end
      end
   
        end
        
        def destroy 
        session[:user_id] = nil   
        flash[:success] = "You have logged out"
        redirect_to signup_path
        
        end
    
end

