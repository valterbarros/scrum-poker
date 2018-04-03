# == Schema Information
#
# Table name: tasks
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_vote_id :integer
#  status          :integer          default(0)
#
# Indexes
#
#  index_tasks_on_session_vote_id  (session_vote_id)
#

class Task < ApplicationRecord
  has_many :votes
  belongs_to :session_vote

  has_and_belongs_to_many :categories
  enum status: [:normal, :in_votation]
end
