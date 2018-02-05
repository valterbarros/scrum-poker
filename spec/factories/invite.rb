FactoryBot.define do

  factory :invite do
    token Digest::SHA1.hexdigest([1, Time.now, 30].join)
    session_vote { FactoryBot.create(:session_vote) }
    recipient { FactoryBot.create(:user) }
    sender { FactoryBot.create(:user) }
  end

end
