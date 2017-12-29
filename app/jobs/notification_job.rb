class NotificationJob < ApplicationJob
  def perform(notification, user_id)
    ActionCable.server.broadcast(
      "notifications:#{user_id}",
      partial: RoomsController.render(partial: 'layouts/notification_item', locals: { notification: notification })
    )
  end
end
