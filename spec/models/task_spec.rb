require 'rails_helper'

describe Task, type: [:models, :task] do

  let(:task) { create :task, title: title }
  let(:title){ "Cadastrar task"}
  context 'When all params are valids' do
    it 'Whould create new task' do
      expect {
        task
      }.to change(Task, :count).by(1)
    end
  end

  context 'When is pass a invalid params' do
    context 'When try create a task with utilized title' do
     before do
       task
     end
     it 'Should not create a new task' do
       expect {
         Task.create(title: title, description:"cadastrar task")
       }.to change(Task, :count).by(0)
     end
    end
  end
end
