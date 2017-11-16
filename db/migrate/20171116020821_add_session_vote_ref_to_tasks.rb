class AddSessionVoteRefToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :session_vote, index: true, foreign_key: true
  end
end
