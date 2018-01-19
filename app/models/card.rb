# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Card < ApplicationRecord
  has_and_belongs_to_many :steps
end
