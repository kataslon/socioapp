class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      flash[:success] = "Logged in!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid email or password"
      render :new
    end
  end

  private

  helper_method :user
  def user
    @user ||= User.new
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
