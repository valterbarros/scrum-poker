require 'rails_helper'

describe SessionVote, type:[:models,:session_vote] do
  let(:task) { create :task }
  let(:tasks) { [task] }

  let(:session_vote) { create :session_vote, tasks: tasks}
  context 'When try open a new session votes with all params valid' do
    it 'create a new object session_vote' do
    expect {
      session_vote
    }.to change(SessionVote, :count).by(1)
    end
  end

  context 'When try open a new session votes with params invalids' do
    let(:tasks) { [] }
    let(:session_vote_with_error) { build :session_vote, tasks: tasks }
    it 'create a new object session_vote without tasks' do
      expect{
        session_vote
      }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should result errors' do
      session_vote_with_error.valid?
      expect(session_vote_with_error.errors.messages[:tasks].first).to eq "can't be blank"
    end
  end

  context 'When user try enter on session_vote' do
    let(:user) { create :user }
    it 'When session_vote is open' do
    expect{
      session_vote
    }.to change(SessionVote, :count).by(1)
    end
    it 'When session_vote is closed' do
      session_vote.update(closed:true)
      expect{
        require 'pry'; binding.pry
        session_vote.update(users:[user])
      }.to raise_error ActiveRecord::RecordInvalid 
    end
  end
end
