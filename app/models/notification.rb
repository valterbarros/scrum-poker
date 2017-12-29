class Notification < ApplicationRecord
  belongs_to :user

  after_commit { NotificationJob.perform_later(self, user.id) }
end
