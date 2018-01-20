module Queries
  class QueryUserForInvite
    def initialize params = {}, relation = User
      @id = params[:id]
      @relation = relation
    end

    def fetch_result
      (user_invite_is_not_the_same + all_in_diferent_room_and_without_room_id)
        .uniq - [owner_from_session, user_invite_is_the_same].flatten
    end

    def user_invite_is_not_the_same
      @relation.distinct
        .joins('inner join invites on users.id = invites.recipient_id')
        .where('invites.session_vote_id != ?', @id)
    end

    def user_invite_is_the_same
      @relation.distinct
        .joins('inner join invites on users.id = invites.recipient_id')
        .where('invites.session_vote_id = ?', @id)
    end

    def all_in_diferent_room_and_without_room_id
      @relation.where('session_vote_id !=? OR session_vote_id IS NULL', @id)
    end

    def owner_from_session
      owner = SessionVote.find(@id).owner
    end
  end
end
