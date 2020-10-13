# == Schema Information
#
# Table name: recurrence_groups
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :recurrence_group do
    association :user
    name { "Some Group" }
  end
end
