class ParticipantJob < ApplicationJob
  def perform(user, room_id)
    ActionCable.server.broadcast("participants:#{room_id}", user: user)
  end
end
