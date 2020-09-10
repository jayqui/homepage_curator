module Types
  class QueryType < Types::BaseObject
    field :random_url_for_current_time, resolver: Queries::RandomUrlQuery
    field :recurrence_groups, resolver: Queries::RecurrenceGroupsQuery
  end
end
