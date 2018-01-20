FactoryGirl.define do
  factory :vote do
    score 5
    session_vote { FactoryGirl.build(:session_vote) }
    task { FactoryGirl.build(:task) }
    user { FactoryGirl.build(:user)}

  end
end
