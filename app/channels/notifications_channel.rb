class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{current_user.id}"
  end

  def received(data)
    # ActionCable.server.broadcast("notifications:#{current_user.id}", data)
  end
end