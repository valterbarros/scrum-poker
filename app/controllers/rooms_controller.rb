class RoomsController < ApplicationController
  before_action :set_session_vote, only: [:show]

  def index
    @session_votes = SessionVote.all
  end

  def show
    @invite = Invite.new
    @users = User.all
    @steps = @session_vote.steps
    if params[:as_user]
      render action: :room_user; return
    elsif user_is_owner_from_session_vote?
      render action: :room_owner_session; return
    end
    redirect_to rooms_path, notice: 'as_user key is missing'
  end

  private
  def user_is_owner_from_session_vote?
    SessionVote.find(params[:id]).owner_id == current_user.id
  end

  def set_session_vote
    @session_vote = SessionVote.find(params[:id])
  end
end
