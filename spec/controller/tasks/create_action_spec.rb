require 'rails_helper'

describe TasksController, '#create' , type: [:controller,:task]  do

  let(:setup) {  }
  let(:title) { "Some Title" }
  before do
    setup
    post :create, { task_params: { title: title, description: "permitindo" } }
  end
  context 'When pass valid params' do
    it 'Should redirect to index tasks' do
      expect(response).to redirect_to(tasks_path) 
    end
    it 'Should display a flash notice' do
      expect(flash[:notice]).to eq ("Task was successfully created.")
    end
  end
  context 'When try create a already created task' do
    let(:task) { create :task, title: title }
    let(:setup) { task }
    it 'Should render new view' do
      expect(response).to render_template("new")
    end

    it 'Should display a flash notice' do
      expect(assigns :errors).to be_instance_of ActiveModel::Errors
    end
  end
end
