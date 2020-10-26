module Mutations::RecurrenceGroup
  class RecurrenceGroupDelete < Mutations::BaseMutation
    argument :recurrence_group_id, ID, required: true

    field :recurrence_group, Types::RecurrenceGroupType, null: true
    field :errors, [String], null: false

    def resolve(recurrence_group_id:)
      recurrence_group = RecurrenceGroup.find(recurrence_group_id)

      if recurrence_group.destroy
        { recurrence_group: recurrence_group, errors: [] }
      else
        { recurrence_group: nil, errors: recurrence_group.errors.full_messages }
      end
    end
  end
end
