module Mutations::LinkSubscription
  class LinkSubscriptionUpdate < Mutations::BaseMutation
    argument :link_subscription_id, ID, required: true
    argument :url, String, required: true

    field :link_subscription, Types::LinkSubscriptionType, null: true
    field :errors, [String], null: false

    def resolve(link_subscription_id:, url:)
      ls = LinkSubscription.find(link_subscription_id)

      if ls.update(url: url)
        { link_subscription: ls, errors: [] }
      else
        { link_subscription: nil, errors: ls.errors.full_messages }
      end
    end
  end
end
