require 'rails_helper'

describe RoomsController, '#vote', type:[:controller, :rooms] do
  let(:user) { create(:user) }
  let(:card) { create(:card) }
  let(:task) { create(:task) }
  let(:session_vote) { create(:session_vote) }

  before do
    sign_in user
    get :vote, params:{ id: session_vote.id, card_id: card.id, task_id: task.id }
  end

  context 'When user access #vote with valid params' do
    it 'should return status 200' do
      expect(response.status).to be == 204
    end

    it "creates a new vote" do
      expect{
        get :vote, params:{ id: session_vote.id, card_id: card.id, task_id: task.id }
      }.to change(Vote, :count).by(1)
    end
  end
end
