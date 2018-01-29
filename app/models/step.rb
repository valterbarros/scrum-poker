# == Schema Information
#
# Table name: steps
#
#  id              :integer          not null, primary key
#  title           :string
#  session_vote_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_steps_on_session_vote_id  (session_vote_id)
#

class Step < ApplicationRecord
  belongs_to :session_vote

  has_and_belongs_to_many :cards

  accepts_nested_attributes_for :cards
end
