module Mutations::RecurrenceRule
  class RecurrenceRuleCreate < Mutations::BaseMutation
    argument :recurrence_group_id, ID, required: true
    argument :attributes, Types::RecurrenceRuleAttributes, required: true

    field :recurrence_rule, Types::RecurrenceRuleType, null: true
    field :errors, [String], null: false

    def resolve(recurrence_group_id:, attributes:)
      recurrence_rule = RecurrenceRule.new(
        recurrence_group_id: recurrence_group_id,
        **attributes.to_h,
      )

      if recurrence_rule.save
        { recurrence_rule: recurrence_rule, errors: [] }
      else
        { recurrence_rule: nil, errors: recurrence_rule.errors.full_messages }
      end
    end
  end
end
