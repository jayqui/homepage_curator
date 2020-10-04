module Mutations::LinkSubscription
  class LinkSubscriptionCreate < Mutations::BaseMutation
    argument :recurrence_group_id, ID, required: true
    argument :url, String, required: true

    field :link_subscription, Types::LinkSubscriptionType, null: true
    field :errors, [String], null: false

    def resolve(url:, recurrence_group_id:)
      link_subscription = LinkSubscription.new(
        recurrence_group_id: recurrence_group_id,
        url: url,
      )

      if link_subscription.save
        { link_subscription: link_subscription, errors: [] }
      else
        { link_subscription: nil, errors: link_subscription.errors.full_messages }
      end
    end
  end
end
