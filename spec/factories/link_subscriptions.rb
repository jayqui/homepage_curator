# == Schema Information
#
# Table name: link_subscriptions
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :link_subscription do
    association :user
    url { "http://example.com" }
  end
end
