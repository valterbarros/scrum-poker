FactoryGirl.define do
  
  factory :session_vote do
    #tasks {[FactoryGirl.create(:task)]}
    #users {[FactoryGirl.create(:user)]}
    owner { FactoryGirl.create(:user) }
  end

end
