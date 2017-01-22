module MessagesHelper

  def owner message
    User.find(message.owner_id)
  end
end
