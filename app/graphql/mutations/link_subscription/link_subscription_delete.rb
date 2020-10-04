module Mutations::LinkSubscription
  class LinkSubscriptionDelete < Mutations::BaseMutation
    argument :link_subscription_id, ID, required: true

    field :link_subscription, Types::LinkSubscriptionType, null: true
    field :errors, [String], null: false

    def resolve(link_subscription_id:)
      ls = LinkSubscription.find(link_subscription_id)
      if ls.destroy
        { link_subscription: ls, errors: [] }
      else
        { link_subscription: nil, errors: ls.errors.full_messages }
      end
    end
  end
end
