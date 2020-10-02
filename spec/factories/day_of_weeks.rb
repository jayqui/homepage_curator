# == Schema Information
#
# Table name: day_of_weeks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :day_of_week do
    name { "monday" }
  end
end
