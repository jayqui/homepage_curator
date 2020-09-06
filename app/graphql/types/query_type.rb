module Types
  class QueryType < Types::BaseObject
    field :random_url_for_current_time, String, null: false do
      argument :user_id, ID, required: true
    end

    def random_url_for_current_time(user_id:, timezone: "UTC")
      now_in_timezone = Time.zone.now.in_time_zone(timezone)
      current_day_of_week = now_in_timezone.strftime("%A").downcase

      LinkSubscription.
        joins(:recurrence_rules).
        where(recurrence_rules: { day_of_week: current_day_of_week }).
        where("recurrence_rules.start_time < ?", now_in_timezone).
        where("recurrence_rules.end_time > ?", now_in_timezone).
        order("random()").
        first.
        url
    end

    # field :recurrence_groups, [Types::RecurrenceGroupType], null: false do
    #   argument :user_id, ID, required: true
    # end
  end
end
