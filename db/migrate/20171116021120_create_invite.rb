class CreateInvite < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.references :session_vote, index: true, foreign_key: true
      t.integer :recipient_id, null: false, index: true
      t.integer :sender_id, null: false, index: true

      t.timestamps
    end
    add_foreign_key :invites, :users, column: :recipient_id, primary_key: :id
    add_foreign_key :invites, :users, column: :sender_id, primary_key: :id
  end
end
