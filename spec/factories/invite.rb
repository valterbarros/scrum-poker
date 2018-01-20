FactoryGirl.define do
  
  factory :invite do
    token Digest::SHA1.hexdigest([1, Time.now, 30].join)
    session_vote { FactoryGirl.create(:session_vote) }
    recipient { FactoryGirl.create(:user) }
    sender { FactoryGirl.create(:user) }
  end

end
