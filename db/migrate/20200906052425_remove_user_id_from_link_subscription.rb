class RemoveUserIdFromLinkSubscription < ActiveRecord::Migration[6.0]
  def change
    remove_reference :link_subscriptions, :user, null: false, foreign_key: true
  end
end
