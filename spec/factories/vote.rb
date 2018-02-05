FactoryBot.define do
  factory :vote do
    score 5
    session_vote { FactoryBot.build(:session_vote) }
    task { FactoryBot.build(:task) }
    user { FactoryBot.build(:user)}
  end
end
