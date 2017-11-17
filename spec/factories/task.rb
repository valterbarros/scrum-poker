FactoryGirl.define do
  factory :task do
    title 
    description "cadastrar task"
    session_vote { FactoryGirl.create(:session_vote) }
  end
end
