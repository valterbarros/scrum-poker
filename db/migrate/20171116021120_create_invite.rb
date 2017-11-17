class CreateInvite < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.references :session_vote, index: true, foreign_key: true
      t.integer :recipient_id, index: true, foreign_key: true
      t.integer :sender_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
