class ChangeTaskChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "change_task:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end
end
