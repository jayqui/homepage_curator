FactoryBot.define do
  factory :link_subscription do
    association :user
    url { "MyString" }
  end
end
