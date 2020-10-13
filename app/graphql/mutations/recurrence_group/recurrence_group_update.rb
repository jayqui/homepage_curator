module Mutations::RecurrenceGroup
  class RecurrenceGroupUpdate < Mutations::BaseMutation
    argument :recurrence_group_id, ID, required: true
    argument :name, String, required: false

    field :recurrence_group, Types::RecurrenceGroupType, null: true
    field :errors, [String], null: false

    def resolve(recurrence_group_id:, name:)
      recurrence_group = RecurrenceGroup.find(recurrence_group_id)

      if recurrence_group.update(name: name)
        { recurrence_group: recurrence_group, errors: [] }
      else
        { recurrence_group: nil, errors: recurrence_group.errors.full_messages }
      end
    end
  end
end
