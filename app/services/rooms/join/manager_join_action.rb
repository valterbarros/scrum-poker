class Services::Rooms::Join::ManagerJoinAction < Struct.new(:token, :notification_id)
  include Waterfall
  include ::Services::Waterfall

  def call
    with_transaction do
      chain { @invite = Invite.find_by_token(token) }

      chain do 
        @user = User.find(@invite.recipient_id) 
        @user.session_vote_id = @invite.session_vote_id
        @user.save!
      end

      chain { @invite.destroy! }
      chain { Notification.find(notification_id).destroy! }
      chain { ParticipantJob.perform_later(@user, @invite.session_vote.id) }
    end
  end
end
