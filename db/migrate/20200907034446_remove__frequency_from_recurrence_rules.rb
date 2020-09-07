class RemoveFrequencyFromRecurrenceRules < ActiveRecord::Migration[6.0]
  def change
    remove_column :recurrence_rules, :frequency, :interval
  end
end
