module Services
  module Rooms
    class ShowManager < Struct.new(:user, :room, :params, :partials)
      def perform
        return partials[:user_action].call if render_user_template?
        return partials[:owner_action].call if render_owner_template?
      end

      private
      def render_owner_template?
        user_is_owner_from_session_vote?
      end

      def render_user_template?
        user_is_included_on_current_session_vote? ||
          user_is_owner_from_session_vote? && params[:as_user]
      end

      def user_is_included_on_current_session_vote?
        user.room_id == room.id
      end

      def user_is_owner_from_session_vote?
        room.owner_id == user.id
      end
    end
  end
end
