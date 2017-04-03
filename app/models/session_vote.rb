class SessionVote < ApplicationRecord
  has_many :votes
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks
end
