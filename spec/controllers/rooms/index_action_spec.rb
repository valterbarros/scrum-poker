require 'rails_helper'

describe RoomsController, '#index', type: [:controller, :room] do
  let(:user) { create(:user) }
  before do
    sign_in user
    get :index
  end

  context 'When access index path' do
    it 'should render index template' do
      expect(subject).to render_template :index
    end
  end
end
