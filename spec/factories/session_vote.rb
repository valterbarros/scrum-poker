FactoryBot.define do
  
  factory :session_vote do
    #tasks {[FactoryBot.create(:task)]}
    #users {[FactoryBot.create(:user)]}
    owner { FactoryBot.create(:user) }
  end

end
