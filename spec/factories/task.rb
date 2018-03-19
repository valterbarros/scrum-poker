FactoryBot.define do
  factory :task do
    title "Fix test errors"
    description "cadastrar task"
    session_vote { FactoryBot.create(:session_vote) }
  end
end
