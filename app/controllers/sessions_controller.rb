class SessionsController < ApplicationController

      def new
      end

      def create
      end
 def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          remember user       # NEW LINE
          redirect_to user
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end

       def destroy
        log_out if logged_in?
        redirect_to root_url
      end 
    end
