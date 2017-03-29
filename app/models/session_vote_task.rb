class SessionVoteTask < ApplicationRecord
  belongs_to :task
  belongs_to :session_vote
end
