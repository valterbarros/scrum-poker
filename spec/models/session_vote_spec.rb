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
      expect(
        Validators::CreateSessionVote.new(tasks: []).valid?
      ).to be false 
    end

    it 'create a new object session_vote with tasks' do
      expect(
        Validators::CreateSessionVote.new(tasks:[Task.first]).valid?
      ).to be true
    end
  end

  context 'When user try enter on session_vote' do
    let(:user) { create :user }
    it 'When session_vote is open' do
      session_vote.update(users:[user])
      session_close = Validators::AddUserSessionVote.new(closed:session_vote.closed, users:[user])
      expect(
        session_vote.valid?
      ).to be_truthy 
    end
    it 'When session_vote is closed' do
      session_vote.update(closed:true)
      session_close = Validators::AddUserSessionVote.new(closed:session_vote.closed, users:[user])
      expect(
        session_close.valid?  
      ).to be false
    end
  end

  context 'When try close a session' do
    let(:user) { create :user }
    let(:session_vote) { create :session_vote}
    it 'When try close a session without users and tasks' do
      expect{
        session_vote
      }.to raise_error ActiveRecord::RecordInvalid
    end

    let(:session_vote) { create :session_vote, tasks: [task], users: [] }
    it 'When try close a session without user' do
      expect{
        session_vote
      }.to raise_error ActiveRecord::RecordInvalid
    end

    let(:session_vote) { create :session_vote, tasks: [], users: [user] }
    it 'When try close a session without task' do
      expect{
        session_vote
      }.to raise_error ActiveRecord::RecordInvalid
    end

    let(:session_vote) { create :session_vote, tasks: [task], users: [user], votes: [Vote.create(vote:5)] }
    it 'When try close a session with user and tasks and votes' do
      cs = Validators::CloseSessionVote.new(users:session_vote.users, tasks:session_vote.tasks, votes:session_vote.votes)
      expect{
        cs.valid?
      }.to be true
    end

    it 'When try close a session withou any votes' do

    end
  end

  context 'When user try close a session_vote' do
  end
end
