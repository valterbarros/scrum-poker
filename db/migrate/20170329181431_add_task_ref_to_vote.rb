class AddTaskRefToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :task, index: true, foreign_key: true
  end
end
