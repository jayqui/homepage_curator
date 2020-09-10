module Types
  class RecurrenceRuleType < Types::BaseObject
    field :id, ID, null: false
    field :recurrence_group_id, Integer, null: false
    field :day_of_week, String, null: true
    field :start_time, String, null: true
    field :end_time, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    def start_time
      object.start_time.strftime("%H:%M:%S")
    end
    def end_time
      object.end_time.strftime("%H:%M:%S")
    end
  end
end
