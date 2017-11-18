module Votation
  extend ActiveSupport::Concern

  def start_remaing_votes
    session_vote = SessionVote.find(current_session_vote_id)
    session[:remaing_votes] = session_vote.users.count
  end

  def votes_decrement
    session[:remaing_votes] -= 1
  end

  def votes_increment
    session[:remaing_votes] += 1
  end
end
