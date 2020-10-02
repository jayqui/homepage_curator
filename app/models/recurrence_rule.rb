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
#  begin_day           :string
#  end_day             :string
#  all_derived_days    :string           default([]), is an Array
#
class RecurrenceRule < ApplicationRecord
  ALL_DAYS = %w[sunday monday tuesday wednesday thursday friday saturday]

  belongs_to :recurrence_group
  has_many :recurrence_days

  validates :start_time, presence: :true
  validates :end_time, presence: :true
  validates :begin_day, inclusion: { in: ALL_DAYS }
  validates :end_day, inclusion: { in: ALL_DAYS }

  before_save :set_derived_days

  private

  def set_derived_days
    self.all_derived_days = derived_days
  end

  def derived_days
    begin_day_index = ALL_DAYS.index(begin_day)
    end_day_index = ALL_DAYS.index(end_day)
    days_wrapped_range = wrapped_range(begin_day_index, end_day_index)

    ALL_DAYS.select.with_index { |_, idx| days_wrapped_range.include?(idx) }
  end

  def wrapped_range(from, to)
    if from <= to
      (from..to).to_a
    else
      (from..6).to_a + (0..to).to_a
    end
  end
end
