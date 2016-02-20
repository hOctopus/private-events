class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      sign_in user
      redirect_to user
    else
      flash[:danger] = "Sign in failed"
      render 'new'
    end
  end

  def destroy
    sign_out current_user
    redirect_to signin_path
  end
end
