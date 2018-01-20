require 'rails_helper'

describe InvitesController, type: [:controller, :invite] do
  let(:session_vote) { create(:session_vote) }
  let(:user) { create(:user) }
  let(:recipient_user) { create(:user) }

  let(:params) do
    {
      invite: {
        recipient_id: recipient_user.id,
        session_vote_id: session_vote.id
      }
    }
  end

  let(:action) { post :create, params: params, xhr: true }

  before do
    sign_in user
  end

  context 'When pass valid params' do
    it 'Should create a invite object' do
      expect{ action }.to change(Invite, :count) 
    end

    it 'Should return status 200' do
      expect(response.status).to be == 200
    end
  end
end
