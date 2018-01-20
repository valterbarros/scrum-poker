class NotificationJob < ApplicationJob
  def perform(notification, user_id)
    ActionCable.server.broadcast(
      "notifications:#{user_id}",
      partial: ApplicationController.render(partial: 'layouts/notification_item', locals: { notification: notification })
    )
  end
end
