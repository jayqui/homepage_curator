class AddBeginningAndEndDaysToRecurrenceRule < ActiveRecord::Migration[6.0]
  def change
    add_column :recurrence_rules, :begin_day, :string
    add_column :recurrence_rules, :end_day, :string
    add_column :recurrence_rules, :all_derived_days, :string, array: true, default: []
  end
end
