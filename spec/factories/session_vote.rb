FactoryBot.define do
  factory :session_vote do
    owner { FactoryBot.create(:user) }
    status :in_progress 
  end
end
