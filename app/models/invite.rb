class Invite < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :session_vote
end
