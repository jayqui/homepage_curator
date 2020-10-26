module Types
  class MutationType < Types::BaseObject
    field :link_subscription_delete, mutation: Mutations::LinkSubscription::LinkSubscriptionDelete
    field :link_subscription_update, mutation: Mutations::LinkSubscription::LinkSubscriptionUpdate
    field :link_subscription_create, mutation: Mutations::LinkSubscription::LinkSubscriptionCreate
    field :recurrence_group_create, mutation: Mutations::RecurrenceGroup::RecurrenceGroupCreate
    field :recurrence_group_delete, mutation: Mutations::RecurrenceGroup::RecurrenceGroupDelete
    field :recurrence_group_update, mutation: Mutations::RecurrenceGroup::RecurrenceGroupUpdate
    field :recurrence_rule_create, mutation: Mutations::RecurrenceRule::RecurrenceRuleCreate
    field :recurrence_rule_delete, mutation: Mutations::RecurrenceRule::RecurrenceRuleDelete
    field :recurrence_rule_update, mutation: Mutations::RecurrenceRule::RecurrenceRuleUpdate
  end
end
