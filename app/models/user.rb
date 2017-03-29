class User < ApplicationRecord
  validates :name, presence: true 
  has_many :votes
  has_many :session_votes_users
end
