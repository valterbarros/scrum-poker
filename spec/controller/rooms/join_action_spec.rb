require 'rails_helper'

describe RoomsController, '#join', type: [:controller, :room] do
  let(:user) { create(:user) }
  let(:session_vote) { create(:session_vote) }
  let(:invite) { create(:invite, recipient: user) }

  before do
    sign_in user
    post :join, params:{ token: invite.token } 
  end

  context 'When access join path' do
    it 'should return status 200' do
      expect(response.status).to be == 204
    end
  end

end
