class CreateRecurrenceRules < ActiveRecord::Migration[6.0]
  def change
    create_table :recurrence_rules do |t|
      t.belongs_to :recurrence_group, null: false, foreign_key: true
      t.string :day_of_week
      t.interval :frequency, default: "1 week"
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
