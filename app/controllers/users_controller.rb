class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign up successful!"
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "Sign up failed"
      redirect_to new_user_path
    end
  end

  def show
    unless signed_in?
      redirect_to signin_path
    else
      @user_events = Event.where(["creator_id = ?", current_user.id])
                          .order(date: :desc)
                          .paginate(page: params[:page], per_page: 3)

    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
