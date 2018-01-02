class User < ApplicationRecord
  alias_attribute :room_id, :session_vote_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :notifications
  has_many :invitations, class_name: 'Invite', foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: 'Invite', foreign_key: 'sender_id'
  
  has_one  :own_session_vote, class_name: 'SessionVote', foreign_key: 'owner_id' 

  belongs_to :session_vote, optional: true

  validates :name, presence: true 
end
