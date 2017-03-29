class SessionVoteUser < ApplicationRecord
  belongs_to :session_vote
  belongs_to :user 
end
