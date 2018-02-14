class FinishVotationChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "finish_votation:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def finish data
    raise unless finish_room data['room_id']
    ActionCable.server.broadcast("finish_votation:#{data['room_id']}", {}) 
  end

  private
  def finish_room id
    s = SessionVote.find(id)
    s.status = :finish
    s.save
  end
end
