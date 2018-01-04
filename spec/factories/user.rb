FactoryGirl.define do
  factory :user do
    name "Valter"
    sequence(:email) { |n| "user#{n}@game.com.br" }
    password 123456 
    session_vote {  }
  end
end
