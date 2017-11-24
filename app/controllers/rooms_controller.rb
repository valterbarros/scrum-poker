class RoomsController < ApplicationController
  before_action :set_session_vote, only: [:show]

  def index
    @session_votes = SessionVote.all
  end

  def show
    @invite = Invite.new
    @users = User.all
    @steps = @session_vote.steps
    current_session_vote_id = @session_vote.id
    if params[:as_user]
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
    @vote = Vote.new(score: @card.title, session_vote: @session_vote, user: current_user, task: @task)
    if @vote.save
      process_queue_service << VoteJob.new(@vote)
      #render :save_success
    else
      #render :save_fail
    end
    require 'pry'; binding.pry
  end

  private
  def user_is_owner_from_session_vote?
    SessionVote.find(params[:id]).owner_id == current_user.id
  end

  def set_session_vote
    @session_vote = SessionVote.find(params[:id])
  end
end
