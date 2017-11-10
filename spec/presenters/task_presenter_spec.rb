require 'rails_helper'

describe TaskPresenter, type: [:presenter, :task] do
  let(:task) { double(title: "Adjust something") }
  subject{ TaskPresenter.new task }

  describe '#description' do
    it 'should return description from task' do
      allow(task).to receive(:description).and_return 'A simple task'
      expected = %[<span>A simple task</span>] 
      expect(subject.description).to eql expected
    end

    it 'should return' do
      allow(task).to receive(:description).and_return ''
      expected = "<span>RSpec::Mocks::Double don&#39;t have description</span>"
      expect(subject.description).to eql expected
    end
  end
end
