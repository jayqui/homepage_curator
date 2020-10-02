# == Schema Information
#
# Table name: recurrence_rules
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  start_time          :time
#  end_time            :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  begin_day           :string
#  end_day             :string
#  all_derived_days    :string           default([]), is an Array
#
FactoryBot.define do
  factory :recurrence_rule do
    association :recurrence_group
    start_time { "2020-09-04 22:22:27" }
    end_time { "2020-09-05 22:22:27" }
    begin_day { "friday" }
    end_day { "monday" }
  end
end
