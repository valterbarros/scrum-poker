class VoteJob < ApplicationJob
  attr_reader :vote, :session_vote_id, :step_id, :user_id

  def initialize(params = {}) 
    super
    @vote = params[:vote]
    @step_id = params[:step].id
    @user_id = @vote.user.id
    @session_vote_id = vote.session_vote.id 
  end

  def perform(argument = {})
    ActionCable.server.broadcast(
      "rooms:#{session_vote_id}", 
      user_id: user_id, 
      score: vote.score,
      step_id: step.id,
      session_vote_id: session_vote_id
    )
  end
end
