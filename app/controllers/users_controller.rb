class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      flash[:success] = "Logged in!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid email or password"
      render :new
    end
  end

  def update
    if user.update_attributes(user_params)
      UserMailer.change_password_email(@user).deliver_now
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  helper_method :user
  def user
    @user ||= User.find_or_initialize_by(id: params[:id])
  end

  helper_method :users
  def users
    @users ||= User.all
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
