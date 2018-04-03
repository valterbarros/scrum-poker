class FinishVotationChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "finish_votation:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def finish data
    change_status_from_task(data['room_id'])
    finish_room data['room_id']
    ActionCable.server.broadcast("finish_votation:#{data['room_id']}", {}) 
  end

  private
  def change_status_from_task room_id, status = Task.statuses[:in_votation]
    task = Task.find_by('session_vote_id = ? AND status = ?', room_id, status)
    task.update(status: :normal) if task
  end

  def finish_room id
    SessionVote.update(id, status: :finish)
  end
end
