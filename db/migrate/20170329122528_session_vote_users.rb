class SessionVoteUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :session_vote_users do |t|
      t.string :score
      t.belongs_to :user, index: true
      t.belongs_to :session_vote, index: true

      t.timestamps
    end
  end
end
