class MessagesController < ApplicationController
  before_filter :authenticate?

  def new
  end

  def show
  end

  def index
  end

  def create
    message = user.messages.new messages_params
    message.owner_id = current_user.id
    if message.save
      flash[:success] = "Message saccessfuly created"
      redirect_to user_messages_url(user)
    else
      flash[:danger] = "Fail"
      render :new
    end
  end

  def update
    if message.update_attributes messages_params
      flash[:success] = "Message saccessfuly updated"
      redirect_to user_messages_url(user)
    else
      flash[:danger] = "Fail"
      render :edit
    end
  end

  def destroy
    message.destroy
    redirect_to user_messages_url(user)
  end

  private

  helper_method :messages
  def messages
    @messages ||= user.messages.order(:created_at)
  end

  helper_method :message
  def message
    @message ||= Message.find(params[:id]) if params[:id]
  end

  helper_method :user
  def user
    @user ||= params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  def authenticate?
    redirect_to log_in_url unless current_user
  end

  def messages_params
    params.require(:message).permit(:user_id, :title, :text)
  end

end
