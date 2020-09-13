# == Schema Information
#
# Table name: recurrence_rules
#
#  id                  :bigint           not null, primary key
#  recurrence_group_id :bigint           not null
#  day_of_week         :string
#  start_time          :time
#  end_time            :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class RecurrenceRule < ApplicationRecord
  belongs_to :recurrence_group

  enum day_of_week: {
    monday: "monday",
    tuesday: "tuesday",
    wednesday: "wednesday",
    thursday: "thursday",
    friday: "friday",
    saturday: "saturday",
    sunday: "sunday",
  }

  validates :day_of_week, presence: :true
  validates :start_time, presence: :true
  validates :end_time, presence: :true
end
