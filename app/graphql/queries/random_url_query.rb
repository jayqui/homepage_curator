module Queries
  class RandomUrlQuery < GraphQL::Schema::Resolver
    type Types::RandomUrlType, null: true

    argument :user_id, ID, required: true

    def resolve(user_id:)
      url = random_url_for_current_time(user_id: user_id)
      { random_url_for_current_time: url }
    end

    private

    def random_url_for_current_time(user_id:, timezone: "UTC")
      now_in_timezone = Time.zone.now.in_time_zone(timezone)
      current_day_of_week = now_in_timezone.strftime("%A").downcase

      LinkSubscription.
        joins(recurrence_rules: :day_of_weeks, recurrence_group: :user).
        where(recurrence_groups: { user_id: user_id }).
        where(recurrence_rules: { day_of_weeks: { name: current_day_of_week }}).
        where("recurrence_rules.start_time < ?", now_in_timezone).
        where("recurrence_rules.end_time > ?", now_in_timezone).
        order("random()").first&.
        url
    end
  end
end
