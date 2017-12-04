class ParticipantUsersChannel < ApplicationCable::Channel 
  def follow(data)
    stop_all_streams
    stream_from "participants:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end
end
