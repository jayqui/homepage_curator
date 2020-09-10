module Types
  class RecurrenceGroupType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :recurrence_rules, [Types::RecurrenceRuleType], null: true
    field :link_subscriptions, [Types::LinkSubscriptionType], null: true
  end
end
