class AddSessionVoteRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :session_vote, index: true, foreign_key: true
  end
end
