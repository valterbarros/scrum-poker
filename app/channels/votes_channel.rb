class VotesChannel < ApplicationCable::Channel
  def follow(room_id)
    stop_all_streams
    stream_from "rooms:#{room_id["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end
end
