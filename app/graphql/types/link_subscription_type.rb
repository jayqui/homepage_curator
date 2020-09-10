module Types
  class LinkSubscriptionType < Types::BaseObject
    field :id, ID, null: false
    field :recurrence_group_id, Integer, null: false
    field :url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
