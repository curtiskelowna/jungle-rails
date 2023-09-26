class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'    
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'    
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end
end
