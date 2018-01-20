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
    puts data['room_id']
    title = "Task: #{data['title']}"
    ActionCable.server.broadcast("change_task:#{data['room_id']}", { title: title })
  end
end
