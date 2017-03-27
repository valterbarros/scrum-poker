require 'rails_helper'

describe TaskControllers, '#create' , type: [:controller,:task]  do

  before do
    post :create, task_params(title:"Permitir os usuários a participar da votação","permitindo")
  end
  context 'When pass valid params ' do
    it 'Should redirect to index tasks' do
      expect(response).to redirect_to(tasks_path) 
    end
    it 'Should display a flash notice' do
      expect(flash[:notice]).to eq ("task was succeful created")
    end
  end
end
