class Task < ApplicationRecord
  validates :title, uniqueness: true 

  has_and_belongs_to_many :session_votes
  has_many :votes
end
