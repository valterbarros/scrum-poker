class Invite < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :session_vote

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.session_vote_id, Time.now, rand].join)
  end

  delegate :id, to: :session_vote, prefix: true, allow_nil: true
end
