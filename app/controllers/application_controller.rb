class ApplicationController < ActionController::Base
  include Votation

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource);rooms_path;end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end

  def current_session_vote
    @session_vote ||= SessionVote.find(session[:session_vote_id])
  end

  def current_session_vote_id=(id)
    session[:session_vote_id] = id
  end

  def current_session_vote_id
    session[:session_vote_id]
  end

  def process_queue_service
    @process_queue_service ||= Services::Votes::ProcessVoteQueue.new
  end
end
