class User < ApplicationRecord
  validates :name, presence: true 
  
  has_many :votes
  has_many :session_vote_users
end
