class UsersSessionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :users_session_votes, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :session_vote, index: true
    end
  end
end
