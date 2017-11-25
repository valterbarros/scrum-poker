class Vote < ApplicationRecord
  attr_accessor :step_position

  belongs_to :session_vote
  belongs_to :task
  belongs_to :user

  after_commit { VoteJob.perform_later(self, step_position) }
end
