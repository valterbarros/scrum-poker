require 'rails_helper'

describe Queries::QueryUserForInvite, type: %i(users queries) do
  subject { Queries::QueryUserForInvite.new params }
  let(:params) {  }
  let(:result) {  }

  context 'When has four users one is owner, other is invited to a room, and two has no room' do
    let(:user) { create(:user) }

    let(:room_002) { create(:session_vote) }

    let(:invite) { create(:invite, recipient: user_003, sender: user_002, session_vote: room) }
    let(:user_003) { create(:user) }
    let(:user_002) { create(:user) }
    let(:room) { create(:session_vote, owner: user_002) }


    let(:params) { { id: room.id } }
    let(:result) { subject.fetch_result }

    before do
      invite
      room_002
      user
    end

    it 'result should be [user, room_002.owner]' do
      expect(result).to match_array [user, room_002.owner]
    end
  end
end
