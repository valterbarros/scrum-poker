class CreateSessionVotesTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :session_votes_tasks, id: false do |t|
      t.belongs_to :task, index: true
      t.belongs_to :session_vote, index: true
    end
  end
end
