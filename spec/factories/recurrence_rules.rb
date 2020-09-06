FactoryBot.define do
  factory :recurrence_rule do
    association :recurrence_group
    day_of_week { "MyString" }
    start_time { "2020-09-04 22:22:27" }
    end_time { "2020-09-05 22:22:27" }
  end
end
