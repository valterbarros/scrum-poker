# require './app/services/rooms/create/manager_create_action'

# describe Services::Rooms::Create::ManagerCreateAction, type: [:services, :rooms] do
#   subject { Services::Rooms::Create::ManagerCreateAction.new params }
#
#   describe '#perform' do
#     context 'When create room with valid params' do
#       before do
#         subject.perform
#       end
#
#       let(:params) do
#         {
#           owner_id: 2,
#           title: 'The first room',
#           self_assign: 1,
#           users_ids: [1,2,3,4,5],
#           tasks_attributes: [],
#           steps_attributes: [cards_attributes: []]
#         }
#       end
#
#       it '@params from subject should be equal params' do
#         expect(subject.params).to be == params
#       end
#     end
#   end
# end
