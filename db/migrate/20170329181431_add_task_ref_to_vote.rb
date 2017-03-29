class AddTaskRefToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :task, index: true
  end
end
