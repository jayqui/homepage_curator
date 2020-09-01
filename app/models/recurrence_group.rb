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
class RecurrenceGroup < ApplicationRecord
  belongs_to :user
  has_many :recurrence_rules
end
