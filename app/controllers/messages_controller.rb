class MessagesController < ApplicationController
  def new
  end

  def show
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  helper_method :messages
  def messages
    @messages ||= user.messages
  end

  helper_method :user
  def user
    @ser ||= User.find(params[:id])
  end

end
