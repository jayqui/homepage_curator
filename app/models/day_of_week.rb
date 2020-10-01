# == Schema Information
#
# Table name: day_of_weeks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DayOfWeek < ApplicationRecord
  has_many :recurrence_days
end
