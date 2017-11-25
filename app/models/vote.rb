class Vote < ApplicationRecord
  belongs_to :session_vote
  belongs_to :task
  belongs_to :user

  after_commit { VoteJob.perform_later(self) }
end
