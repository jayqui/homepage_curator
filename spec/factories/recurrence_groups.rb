FactoryBot.define do
  factory :recurrence_group do
    association :user
    name { "MyString" }
  end
end
