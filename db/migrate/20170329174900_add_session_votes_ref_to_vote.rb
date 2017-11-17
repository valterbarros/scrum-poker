class AddSessionVotesRefToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :session_vote, index: true, foreign_key: true
  end
end
