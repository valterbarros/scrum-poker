# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_notifications_on_user_id  (user_id)
#

class Notification < ApplicationRecord
  belongs_to :user

  after_commit { NotificationJob.perform_later(self, user.id) }
end
