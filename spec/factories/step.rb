FactoryGirl.define do

  factory :step do
    title '1'
    session_vote { FactoryGirl.create(:session_vote) }
  end
end
