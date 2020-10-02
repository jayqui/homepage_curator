class CreateDaysOfWeek < ActiveRecord::Migration[6.0]
  def change
    create_table :days_of_week do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
