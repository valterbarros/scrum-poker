class VoteJob < ApplicationJob
  def perform(vote)
    ActionCable.server.broadcast(
      "rooms:#{vote.session_vote.id}", 
      user_id: vote.user.id, 
      score: vote.score,
      session_vote_id: vote.session_vote.id
    )
  end
end
