require 'rails_helper'

describe RoomsController, '#join', type: [:controller, :room] do
  let(:user) { create(:user) }
  let(:invite) { create(:invite, recipient: user) }

  before do
    sign_in user
    get :join, params: { token: invite.token } 
  end

  context 'When access join path' do
    context 'When current user is the same recipient from invite' do
      it 'should redirect to room path' do
        expect(subject).to redirect_to room_path(invite.session_vote_id)
      end
    end

    context 'When current user is not the same recipient from invite' do
      let(:invite) { create(:invite) }
      it 'should redirect to root_path' do
        expect(subject).to redirect_to root_path
      end

      it 'expect flash error message' do
        expect(flash[:error]).to eq 'You cannot enter in this room'
      end
    end
  end

end
