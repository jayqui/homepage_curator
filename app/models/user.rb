# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :recurrence_groups
  has_many :link_subscriptions, through: :recurrence_groups

  validates :email, presence: :true
  validates :first_name, presence: :true
end
