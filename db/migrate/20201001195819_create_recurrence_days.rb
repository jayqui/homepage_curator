class CreateRecurrenceDays < ActiveRecord::Migration[6.0]
  def change
    create_table :recurrence_days do |t|
      t.belongs_to :recurrence_rule, null: false, foreign_key: true
      t.belongs_to :day_of_week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
