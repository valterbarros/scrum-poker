module RoomsHelper
  def mount_show_path(session_vote)
    return room_path(id: session_vote.id, as_user: 1) unless session_vote.owner_id == current_user.id
    return room_path(session_vote.id)
  end
end
