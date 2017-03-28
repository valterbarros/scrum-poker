class CreateSessionVote < ActiveRecord::Migration[5.0]
  def change
    create_table :session_votes do |t|
      t.boolean :closed, default: false
      
      t.timestamps
    end
  end
end
