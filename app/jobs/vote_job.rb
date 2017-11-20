class VoteJob < ApplicationJob
  def perform(vote)
    ActionCable.server.broadcast(
      "rooms:#{vote.session_vote.id}", 
      user: vote.user.name, score: vote.score
    )
  end
end
