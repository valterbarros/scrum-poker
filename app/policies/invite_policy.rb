class InvitePolicy < ApplicationPolicy
  def initialize(user, invite)
    @user = user
    @invite = invite
  end

  def join?
    @invite.recipient == @user
  end
end
