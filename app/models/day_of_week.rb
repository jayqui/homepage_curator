# == Schema Information
#
# Table name: days_of_week
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DayOfWeek < ApplicationRecord
  has_many :recurrence_days
end
