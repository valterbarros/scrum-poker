# == Schema Information
#
# Table name: invites
#
#  id              :integer          not null, primary key
#  session_vote_id :integer
#  recipient_id    :integer          not null
#  sender_id       :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  token           :string           not null
#
# Indexes
#
#  index_invites_on_recipient_id     (recipient_id)
#  index_invites_on_sender_id        (sender_id)
#  index_invites_on_session_vote_id  (session_vote_id)
#

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
