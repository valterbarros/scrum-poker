class RoomsController < ApplicationController
  before_action :set_session_vote, only: [:show]

  def index
    @session_votes = SessionVote.all
  end

  def show
    @invite = Invite.new
    @users = User.all
    @steps = @session_vote.steps.to_a
    current_session_vote_id = @session_vote.id
    if params[:as_user]
      @owner_session = user_is_owner_from_session_vote?
      render action: :room_user; return
    elsif user_is_owner_from_session_vote?
      render action: :room_owner_session; return
    end
    redirect_to rooms_path, notice: 'as_user key is missing'
  end

  def vote
    @card = Card.find(params[:card_id])
    @session_vote = SessionVote.find(params[:id])
    @task = Task.find(params[:task_id])
    @step_position = params[:step_position]
    @vote = Vote.new(score: @card.title, session_vote: @session_vote, user: current_user, task: @task, step_position: @step_position)
    if @vote.save
      render :vote_success; return
    else
      render :vote_fail; return
    end
  end

  private
  def user_is_owner_from_session_vote?
    SessionVote.find(params[:id]).owner_id == current_user.id
  end

  def set_session_vote
    @session_vote = SessionVote.find(params[:id])
  end
end
