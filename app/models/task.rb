class Task < ApplicationRecord
  validates :title, uniqueness: true 
end
