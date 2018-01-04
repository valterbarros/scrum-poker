require 'rails_helper'

describe Queries::QueryUserForInvite, type: %i(users queries) do
  subject { Queries::QueryUserForInvite.new params }
  let(:params) {  }
  let(:result) {  }

  context 'When tow users one is owner and other has no room' do
    let(:room_002) { create(:session_vote) }
    let(:user_003) { create(:user) }
    let(:invite) { create(:invite, recipient: user_003, sender: user_002, session_vote: room_002) }

    let(:user_002) { create(:user) }
    let(:room) { create(:session_vote, owner: user_002) }

    let(:user) { create(:user) }

    let(:params) { { id: room.id } }
    let(:result) { subject.fetch_result }

    before do
      invite
      user
    end

    it 'result should be [user]' do
      expect(result).to match_array [user, user_003, room_002.owner]
    end
  end
end
