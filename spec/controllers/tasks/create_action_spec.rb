require 'rails_helper'

describe TasksController, '#create' , type: [:controller,:task]  do
  let(:setup) {  }
  let(:user) { create(:user) }
  let(:title) { "Some Title" }
  let(:task) { create :task}

  before do
    setup
    sign_in user
    post :create, { params: { task_params: { title: task.title, description: task.description} } }
  end

  context 'When try create a already created task' do
    let(:setup) { task }
    it 'Should render new view' do
      expect(response).to render_template("new")
    end

    it 'Should display a flash notice' do
      expect(assigns :errors).to be_instance_of ActiveModel::Errors
    end
  end
end
