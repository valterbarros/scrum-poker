class Step < ApplicationRecord
  belongs_to :session_vote

  has_and_belongs_to_many :cards
end
