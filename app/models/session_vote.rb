class SessionVote < ApplicationRecord
  has_many :votes
  has_many :session_vote_tasks
  has_many :session_vote_users
end
