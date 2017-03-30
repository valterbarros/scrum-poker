require 'rails_helper'

describe TasksController, '#create' , type: [:controller,:task]  do
  let(:setup) {  }
  let(:title) { "Some Title" }
  before do
    setup
    post :create, { task_params: { title: title, description: "permitindo" } }
  end

  context 'When try create a already created task' do
    let(:task) { create± :task, title: title }
    let(:setup) { task }
    it 'Should render new view' do
      expect(response).to render_template("new")
    end

    it 'Should display a flash notice' do
      expect(assigns :errors).to be_instance_of ActiveModel::Errors
    end
  end
end
