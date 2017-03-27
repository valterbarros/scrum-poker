require 'rails_helper'

describe Task, type: [:models, :task] do

  let(:task) { create :task, title: title }
  let(:title){ "Cadastrar task"}
  context 'when all params are valids' do
    it 'should create new task' do
      expect {
        task
      }.to change(Task, :count).by(1)
    end
  end

  context 'when is pass a invalid params' do
    context 'when try create a task with utilized title' do
     before do
       task
     end
     it 'should not create a new task' do
       expect {
         Task.create(title: title, description:"cadastrar task")
       }.to change(Task, :count).by(0)
     end
    end
  end
end
