module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed

    end
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
