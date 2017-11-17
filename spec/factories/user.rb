FactoryGirl.define do
  factory :user do
    name "Valter"
    email "valter@gmail.com"
    password 123456 
    session_vote { FactoryGirl.create(:session_vote) }
  end
end
