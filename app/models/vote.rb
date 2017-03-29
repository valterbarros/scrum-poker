class Vote < ApplicationRecord
  belongs_to :session_vote
  belongs_to :task
  belongs_to :user
end
