class RoomsController < ApplicationController
  before_action :set_session_vote, only: [:show]
  helper_method :user_is_included_on_current_session_vote?

  def index
    @session_votes = SessionVote.all
  end

  def show
    set_current_session_vote_id(@session_vote.id)

    @invite = Invite.new
    @users = User.where(session_vote_id: params[:id])
    @users_for_invite = Queries::QueryUserForInvite.new(params).fetch_result  
    @steps = @session_vote.steps.to_a
    @owner_session = user_is_owner_from_session_vote?

    show_manager_action.choise_response(response_params_show) do |format|
      format.user_action { render(action: :room_user) }
      format.owner_action { render(action: :room_owner_session) }
      format.default { redirect_to rooms_path }
    end
  end

  def new
    @users_for_invite = User.all
  end

  def create
    s = Services::Rooms::Create::ManagerCreateAction.new room_params
    s.perform

    redirect_to rooms_path
  end

  def vote
    @card = Card.find(vote_params[:card_id])
    @session_vote = SessionVote.find(vote_params[:id])
    @task = Task.find(vote_params[:task_id])
    @step_position = vote_params[:step_position]
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

    @invite.destroy
    Notification.find(params[:notification_id]).destroy
  end

  private
  def vote_params
    params.require(:vote).permit(:card_id, :id, :step_id, :task_id, :step_position)
  end

  def show_manager_action
    Services::Rooms::Show::ManagerShowAction.new
  end

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

  def room_params
    params[:room][:steps_attributes].each do |steps|
      steps[:cards_attributes].split(',').each do |card|
        steps[:cards_attributes] = [] if steps[:cards_attributes].is_a?(String)
        steps[:cards_attributes] << { title: card }
      end
    end

    params.require(:room).permit(:owner_id, :title, :self_assign, users_ids: [], 
                                 tasks_attributes: [:id, :title], steps_attributes: [:id, :title, cards_attributes: [:title]])
  end
end
