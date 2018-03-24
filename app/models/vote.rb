# == Schema Information
#
# Table name: votes
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_vote_id :integer
#  user_id         :integer
#  task_id         :integer
#  score           :string
#
# Indexes
#
#  index_votes_on_session_vote_id  (session_vote_id)
#  index_votes_on_task_id          (task_id)
#  index_votes_on_user_id          (user_id)
#

class Vote < ApplicationRecord
  attr_accessor :step_position

  alias_attribute :room, :session_vote
  alias_attribute :room_id, :session_vote_id

  belongs_to :session_vote
  belongs_to :task
  belongs_to :user

  after_commit { VoteJob.perform_later(self, step_position) }

  validate :room_status_is_valid?

  private

  def room_status_is_valid?
    errors.add(:room_id, I18n.t(:room_invalid_status, scope: 'activerecord.errors.vote')) \
      unless room.in_progress? 
  end
end
