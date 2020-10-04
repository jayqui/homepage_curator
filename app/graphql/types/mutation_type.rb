module Types
  class MutationType < Types::BaseObject
    field :link_subscription_delete, mutation: Mutations::LinkSubscription::LinkSubscriptionDelete
    field :link_subscription_update, mutation: Mutations::LinkSubscription::LinkSubscriptionUpdate
    field :link_subscription_create, mutation: Mutations::LinkSubscription::LinkSubscriptionCreate
  end
end
