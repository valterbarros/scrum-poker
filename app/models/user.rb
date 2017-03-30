class User < ApplicationRecord
  validates :name, presence: true 
  
  has_and_belongs_to_many :session_votes
  has_many :votes
end
