module Mutations::RecurrenceRule
  class RecurrenceRuleUpdate < Mutations::BaseMutation
    argument :recurrence_rule_id, ID, required: true
    argument :attributes, Types::RecurrenceRuleAttributes, required: true

    field :recurrence_rule, Types::RecurrenceRuleType, null: true
    field :errors, [String], null: false

    def resolve(recurrence_rule_id:, attributes:)
      recurrence_rule = RecurrenceRule.find(recurrence_rule_id)

      if recurrence_rule.update(attributes.to_h)
        { recurrence_rule: recurrence_rule, errors: [] }
      else
        { recurrence_rule: nil, errors: recurrence_rule.errors.full_messages }
      end
    end
  end
end
