class Invite < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :session_vote

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.message_id, Time.now, rand].join)
  end
end
