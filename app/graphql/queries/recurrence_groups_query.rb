module Queries
  class RecurrenceGroupsQuery < GraphQL::Schema::Resolver
    type [Types::RecurrenceGroupType], null: true

    argument :user_id, ID, required: true

    def resolve(user_id:)
      RecurrenceGroup.where(user_id: user_id)
    end
  end
end
