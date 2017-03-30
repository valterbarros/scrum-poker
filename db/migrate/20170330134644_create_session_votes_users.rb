class CreateSessionVotesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :session_votes_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :session_vote, index: true
    end
  end
end
