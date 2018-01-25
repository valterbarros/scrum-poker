module Services
  module Rooms
    module Create
      class ManagerCreateAction
        attr_reader :params, :room
        include ActiveSupport::Callbacks
        define_callbacks :perform
        set_callback :perform, :after, :self_assign_owner, :invite_users_to_room

        def initialize params
          @params = params
          @owner = User.find(params[:owner_id])
        end

        def perform
          run_callbacks :perform do
            @room = SessionVote.new(params.except(:self_assign, :users_ids))
            @room.save!
          end
        end

        private
        def self_assign_owner
          return unless params[:self_assign].present?
          @owner.session_vote_id = room.id
        end

        def invite_users_to_room
          return unless params[:users_ids].present?
          params[:users_ids].each do |recipient_id|
            invite = Invite.new(sender_id: params[:owner_id], recipient_id: recipient_id, session_vote: @room)
            create_notification(recipient_id, invite.token) if invite.save
          end
        end

        def create_notification recipient_id, token
          Notification.new(
            title: "You are invited for a new session by #{@owner.name}",
            body: "Do you wanna accept the invite?",
            user_id: recipient_id,
            url: "/rooms/join/#{token}"
          ).save
        end
      end
    end
  end
end
