require 'rails_helper'

describe RoomsController, '#vote', type:[:controller, :room] do
  let(:user) { create(:user) }
  let(:card) { create(:card) }
  let(:task) { create(:task) }
  let(:step) { create(:step)}
  let(:session_vote) { create(:session_vote) }

  let(:params) do
    {
      vote: { id: session_vote.id, card_id: card.id, task_id: task.id, step_id: step.id, step_position: 0 }
    }
  end

  before do
    session_vote
    sign_in user
    action
  end

  let(:action) { get :vote, params: params, xhr: true }

  context 'When user access #vote with valid params' do
    it 'should return status 200' do
      expect(response.status).to be == 200
    end

    it 'should render :vote_success' do
      expect(subject).to render_template :vote_success
    end

    it "creates a new vote" do
      expect{
        get :vote, params: params, xhr:true
      }.to change(Vote, :count).by(1)
    end
  end

  context 'When room is not in progress' do
    let(:room) { create :session_vote, status: :finish }
    let(:params) do 
      {
        vote: { id: room.id, card_id: card.id, task_id: task.id, step_id: step.id, step_position: 0 }
      }
    end

    it 'should render :vote_fail' do
      expect(subject).to render_template :vote_fail
    end

    it "show dont create a new vote" do
      expect{
        get :vote, params: params, xhr:true
      }.to change(Vote, :count).by(0)
    end

    it 'Vote error menssage should be eq Room need be in progress to vote' do
      expect(assigns(:vote).errors.messages[:room_id].join).to eq "Room need be in progress to vote"
    end
  end
end
