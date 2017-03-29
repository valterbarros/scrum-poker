class AddSessionVotesRefToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :session_vote, index: true
  end
end
