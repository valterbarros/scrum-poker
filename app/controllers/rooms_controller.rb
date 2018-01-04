class RoomsController < ApplicationController
  include ActionController::TypeResponse 

  before_action :set_session_vote, only: [:show]

  def index
    @session_votes = SessionVote.all
  end

  def show
    set_current_session_vote_id(@session_vote.id)

    @invite = Invite.new
    @users = User.where(session_vote_id: params[:id])
    @all_users = User.where('session_vote_id !=? OR session_vote_id IS NULL', params[:id])
    @steps = @session_vote.steps.to_a
    @owner_session = user_is_owner_from_session_vote?

    choise_response(response_params_show) do |format|
      format.user_action { return render(action: :room_user) }
      format.owner_action { return render(action: :room_owner_session) }
    end
  end

  def vote
    @card = Card.find(params[:card_id])
    @session_vote = SessionVote.find(params[:id])
    @task = Task.find(params[:task_id])
    @step_position = params[:step_position]
    @vote = Vote.new(score: @card.title, 
                     session_vote: @session_vote, 
                     user: current_user, 
                     task: @task, 
                     step_position: @step_position)
    if @vote.save
      return render :vote_success
    else
      return render :vote_fail
    end
  end

  def join
    redirect_to(room_path(@invite.session_vote)) if user_is_owner_from_session_vote?
    @invite = Invite.find_by_token(params[:token])
    authorize @invite
    if @invite
      current_user.session_vote = @invite.session_vote
      current_user.save
      ParticipantJob.perform_later(current_user, @invite.session_vote.id)
      redirect_to(room_path(@invite.session_vote))
    end
  end

  private

  def response_params_show
    {
      user: current_user,
      room: @session_vote, 
      as_user: params[:as_user]
    }
  end

  def user_is_owner_from_session_vote?
    return false unless params[:id]
    SessionVote.find(params[:id]).owner_id == current_user.id
  end

  def user_is_included_on_current_session_vote?
    current_user.session_vote_id == @session_vote.id
  end

  def set_session_vote
    @session_vote = SessionVote.find(params[:id])
  end
end
