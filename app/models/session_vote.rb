class SessionVote < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :task
  has_many :votes
end
