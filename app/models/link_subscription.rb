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
class LinkSubscription < ApplicationRecord
  belongs_to :recurrence_group
  has_one :user, through: :recurrence_group
  has_many :recurrence_rules, through: :recurrence_group

  validates :url, presence: :true
end
