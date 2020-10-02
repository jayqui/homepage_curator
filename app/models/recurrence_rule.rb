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
#
class RecurrenceRule < ApplicationRecord
  belongs_to :recurrence_group
  has_many :recurrence_days
  has_many :days_of_week, through: :recurrence_days

  validates :start_time, presence: :true
  validates :end_time, presence: :true
end
