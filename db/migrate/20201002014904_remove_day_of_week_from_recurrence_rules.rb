class RemoveDayOfWeekFromRecurrenceRules < ActiveRecord::Migration[6.0]
  def change
    remove_column :recurrence_rules, :day_of_week, :string
  end
end
