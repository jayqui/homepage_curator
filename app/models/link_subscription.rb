# == Schema Information
#
# Table name: link_subscriptions
#
#  id                  :bigint           not null, primary key
#  user_id             :bigint           not null
#  recurrence_group_id :bigint           not null
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class LinkSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :recurrence_group
  has_many :recurrence_rules, through: :recurrence_group
end
