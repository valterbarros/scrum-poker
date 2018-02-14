class ChangeTaskChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "change_task:#{data["room_id"]}"
  end

  def unfollow
    stop_all_streams
  end

  def change_task(data)
    data = data['data']
    raise unless open_room data['room_id']
    title = "Task: #{data['title']}"
    ActionCable.server.broadcast("change_task:#{data['room_id']}", 
                                 { title: title, task_id: data['task_id'] })
  end

  private

  def open_room id
    s = SessionVote.find(id)
    s.status = :in_progress
    s.save
  end
end
