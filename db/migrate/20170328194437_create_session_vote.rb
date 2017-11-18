class CreateSessionVote < ActiveRecord::Migration[5.0]
  def change
    create_table :session_votes do |t|
      t.string :title
      t.integer :status, default: 0
      t.integer :owner_id, null: false, index: true
      
      t.timestamps
    end
    add_foreign_key :session_votes, :users, column: :owner_id, primary_key: :id
  end
end
