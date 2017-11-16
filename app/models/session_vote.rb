class SessionVote < ApplicationRecord
  has_many :votes
  has_many :tasks
  has_many :users
  has_many :invites
  has_many :steps

  enum status: [ :in_progress, :finish ]
end
