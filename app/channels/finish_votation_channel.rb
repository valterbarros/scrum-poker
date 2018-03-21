class FinishVotationChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "finish_votation:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def finish data
    change_status_from_tasks(data['room_id'])
    finish_room data['room_id']
    ActionCable.server.broadcast("finish_votation:#{data['room_id']}", {}) 
  end

  private
  def change_status_from_tasks room_id
    SessionVote.find(room_id).tasks.update_all(status: :normal)
  end

  def finish_room id
    SessionVote.update(id, status: :finish)
  end
end
