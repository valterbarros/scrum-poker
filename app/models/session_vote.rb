class SessionVote < ApplicationRecord
  has_many :votes
  has_many :tasks
  has_many :users
  has_many :invites
  has_many :steps

  belongs_to :owner, class_name: 'User'

  enum status: [ :in_progress, :finish ]
end
