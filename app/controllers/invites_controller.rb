class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.sender = current_user
    if @invite.save
      @notification = Notification.new(
        title: "You are invited for a new session by #{current_user.name} for room: #{@invite.session_vote.title}",
        body: "Do you wanna accept the invite?",
        user_id: invite_params[:recipient_id],
        url: join_rooms_path(@invite.token)
      ).save

      params[:id] = @invite.session_vote_id
      @invite = Invite.new
      @users_for_invite = Queries::QueryUserForInvite.new({id:params[:id]}).fetch_result  
    end
    render :reload_users
  end

  def reload_users
    @invite = Invite.new
    @users_for_invite = Queries::QueryUserForInvite.new({id:params[:id]}).fetch_result  
    render :reload_users
  end
  
  private

  def invite_params
    params.require(:invite).permit(:recipient_id, :session_vote_id)
  end
end
