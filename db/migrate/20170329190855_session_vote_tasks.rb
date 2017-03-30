class SessionVoteTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :session_vote_tasks do |t|
      t.string :time
      t.belongs_to :task, index: true
      t.belongs_to :session_vote, index: true

      t.timestamps
    end
  end
end
