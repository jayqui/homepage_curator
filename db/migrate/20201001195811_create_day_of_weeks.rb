class CreateDayOfWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :day_of_weeks do |t|
      t.string :name

      t.timestamps
    end
  end
end
