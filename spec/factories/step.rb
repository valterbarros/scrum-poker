FactoryBot.define do

  factory :step do
    title '1'
    session_vote { FactoryBot.create(:session_vote) }
  end
end
