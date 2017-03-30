class Task < ApplicationRecord
  validates :title, uniqueness: true 
  
  has_many :session_vote_tasks
  has_many :votes
end
