module Mutations::RecurrenceGroup
  class RecurrenceGroupCreate < Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :name, String, required: true

    field :recurrence_group, Types::RecurrenceGroupType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, name:)
      recurrence_group = RecurrenceGroup.new(user_id: user_id, name: name)

      if recurrence_group.save
        { recurrence_group: recurrence_group, errors: [] }
      else
        { recurrence_group: nil, errors: recurrence_group.errors.full_messages }
      end
    end
  end
end
