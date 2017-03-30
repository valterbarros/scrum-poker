class SessionVote < ApplicationRecord
  has_many :votes
  validates :tasks, presence: true, on: :create 
  validate :session_closed, on: :update

  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks

  private
  def session_closed
    if self.closed
      errors.add(:session_is_closed, "Can't add user on session closed")
    end
  end
end
