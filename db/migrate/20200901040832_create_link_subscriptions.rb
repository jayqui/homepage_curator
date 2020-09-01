class CreateLinkSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :link_subscriptions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :recurrence_group, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
