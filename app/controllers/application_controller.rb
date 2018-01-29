class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :current_user_notification

  def after_sign_in_path_for(resource);rooms_path;end

  def current_user_notification 
    return [] unless current_user 
    @notifications = Notification.where(user_id: current_user.id).order('created_at desc')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end

  def current_session_vote
    @session_vote ||= SessionVote.find(session[:session_vote_id])
  end

  def set_current_session_vote_id(id)
    session[:session_vote_id] = id
  end

  def current_session_vote_id
    session[:session_vote_id]
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

end
