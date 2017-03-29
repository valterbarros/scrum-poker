class Task < ApplicationRecord
  validates :title, uniqueness: true 
  has_many :session_votes_tasks
  has_many :votes
end
