module Votation
  extend ActiveSupport::Concern

  def start_remaing_votes
    session_vote = SessionVote.find(current_session_vote_id)
    session[:remaing_votes] = session_vote.users.count
  end

  def votes_decrement(user_id)
    session[:remaing_votes] ||= 0
    session[:remaing_votes] -= 1 unless current_user_voted? 
    session[:current_user_voted] = true
  end

  def votes_increment
    session[:remaing_votes] ||= 0
    session[:remaing_votes] += 1 
  end

  def current_user_voted?
    session[:current_user_voted]
  end

end
