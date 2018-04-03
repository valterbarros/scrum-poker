class ChangeTaskChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "change_task:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def change_task(data)
    return unless data["task_id"].present?
    change_status_from_task data["task_id"]
    open_room(data['room_id'])
    title = "Task: #{Task.find(data['task_id']).title}"
    ActionCable.server.broadcast("change_task:#{data['room_id']}", 
                                 { title: title, task_id: data['task_id'] })
  end

  private
  def change_status_from_task task_id
    Task.update(task_id, status: :in_votation)
  end

  def open_room id
    SessionVote.update(id, status: :in_progress)
  end
end
