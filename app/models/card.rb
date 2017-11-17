class Card < ApplicationRecord
  has_and_belongs_to_many :steps
end
