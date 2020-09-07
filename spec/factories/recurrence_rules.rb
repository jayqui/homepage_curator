# == Schema Information
#
# Table name: recurrence_rules
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  day_of_week         :string
#  start_time          :time
#  end_time            :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :recurrence_rule do
    association :recurrence_group
    day_of_week { "MyString" }
    start_time { "2020-09-04 22:22:27" }
    end_time { "2020-09-05 22:22:27" }
  end
end
