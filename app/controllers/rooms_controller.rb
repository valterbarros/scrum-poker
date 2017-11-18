class RoomsController < ApplicationController
  before_action :set_session_vote, only: [:show]

  def index
    @session_votes = SessionVote.all
  end

  def show
    @invite = Invite.new
    @users = User.all
    render action: :room_owner_session
  end

  private
  def set_session_vote
    @session_vote = SessionVote.find(params[:id])
  end
end
