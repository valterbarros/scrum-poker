class Task < ApplicationRecord
  has_many :votes
  belongs_to :session_vote

  has_and_belongs_to_many :categories

  validates :title, uniqueness: true 
end
