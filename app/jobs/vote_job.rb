class VoteJob < ApplicationJob
  attr_reader :vote, :session_vote_id

  def initialize(vote) 
    super
    @vote = vote
    @session_vote_id = vote.session_vote.id 
  end

  def perform(argument = {})
    ActionCable.server.broadcast(
      "rooms:#{session_vote_id}", 
      user: vote.user.name, score: vote.score
    )
  end
end
