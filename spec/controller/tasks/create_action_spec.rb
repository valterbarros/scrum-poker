require 'rails_helper'

describe TasksController, '#create', type: [:controller,:task] do

  before do
    post :create, { title:"Permitir os usuários a participar da votação", description:"permitindo" }
  end

  context 'When pass valid params' do
    it 'Should redirect to index tasks' do
      expect(response).to redirect_to(tasks_path) 
    end
    it 'Should display a flash notice' do
      expect(flash[:notice]).to eq ("Task was successfully created.")
    end
  end

end

