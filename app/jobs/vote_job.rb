class VoteJob < ApplicationJob
  def perform(vote, step_position)
    ActionCable.server.broadcast(
      "rooms:#{vote.session_vote.id}", 
      user_id: vote.user.id, 
      score: vote.score,
      step_position: step_position,
      session_vote_id: vote.session_vote.id
    )
  end
end
