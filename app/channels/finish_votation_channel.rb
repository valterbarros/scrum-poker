class FinishVotationChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "finish_votation:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def finish data
    finish_room data['room_id']
    ActionCable.server.broadcast("finish_votation:#{data['room_id']}", {}) 
  end

  private
  def finish_room id
    SessionVote.update(id, status: :finish)
  end
end
