require 'rails_helper'


describe RoomsController, '#remove_user', type: [:controller, :room] do
  let!(:user) { create(:user) }
  let!(:removable_user) { create(:user) }
  let!(:session_vote) { create(:session_vote, owner: user, users: [removable_user, user]) }
  
    it "removes the correct user from session_vote.users array" do
        sign_in user
        delete :remove_user, params: {session_vote_id: session_vote.id, user_id: removable_user.id}
        expect(SessionVote.where(id: session_vote.id).first.users).to eq [user]
    end
    
    it "redirects back to room" do
        sign_in user
        delete :remove_user, params: {session_vote_id: session_vote.id, user_id: removable_user.id}
        expect(response).to redirect_to room_path(session_vote)
    end
end


