# == Schema Information
#
# Table name: session_votes
#
#  id         :integer          not null, primary key
#  title      :string
#  status     :integer          default("in_progress")
#  owner_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_session_votes_on_owner_id  (owner_id)
#

class SessionVote < ApplicationRecord
  has_many :votes
  has_many :tasks
  has_many :users
  has_many :invites
  has_many :steps

  belongs_to :owner, class_name: 'User'

  enum status: [ :in_progress, :finish, :closed ]
  accepts_nested_attributes_for :tasks, :steps
end
