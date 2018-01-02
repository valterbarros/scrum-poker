require 'rails_helper'

describe RoomsController, '#show', type: [:controller, :room] do
  before do
    sign_in user
    action
  end

  context 'When access index path' do
    context 'When user is owner from room' do
      let!(:user) { create(:user) }
      let!(:session_vote) { create(:session_vote, owner: user) }

      context 'When owner access show with as_user param' do
        let(:action) { get :show, params: { id: session_vote.id, as_user: 1 } }
        it 'should render :room_user template' do
          expect(subject).to render_template :room_user
        end
      end

      context 'When owner access show without as_user param' do
        let(:action) { get :show, params: { id: session_vote.id } }

        it 'should render :room_user template' do
          expect(subject).to render_template :room_owner_session
        end
      end
    end

    context 'When user is not owner from room' do
      let(:user_001) { create(:user) }
      let!(:session_vote) { create(:session_vote, owner: user_001) }
      let(:action) { get :show, params: { id: session_vote.id } }

      context 'When user is participant from room' do
        let!(:user) { create(:user, session_vote: session_vote) }

        it 'should render :room_user template' do
          expect(subject).to render_template :room_user
        end
      end
    end
  end
end
