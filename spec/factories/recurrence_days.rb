# == Schema Information
#
# Table name: recurrence_days
#
#  id                 :bigint           not null, primary key
#  recurrence_rule_id :bigint           not null
#  day_of_week_id     :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :recurrence_day do
    recurrence_rule { nil }
    day_of_week { nil }
  end
end