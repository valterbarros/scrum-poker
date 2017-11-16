class CreateSessionVote < ActiveRecord::Migration[5.0]
  def change
    create_table :session_votes do |t|
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
