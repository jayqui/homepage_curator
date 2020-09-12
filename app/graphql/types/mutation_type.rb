module Types
  class MutationType < Types::BaseObject
    field :link_subscription_update, mutation: Mutations::LinkSubscriptionUpdate
    field :link_subscription_create, mutation: Mutations::LinkSubscriptionCreate
  end
end
