5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
  )
  2.times do
    recurrence_group = RecurrenceGroup.create(
      user: user,
      name: Faker::Game.title,
    )
    3.times do
      RecurrenceRule.create(
        recurrence_group: recurrence_group,
        day_of_week: RecurrenceRule.day_of_weeks.keys.sample,
        frequency: "1 week",
        start_time: "03:00",
        end_time: "21:00",
      )
    end
    5.times do
      LinkSubscription.create(
        recurrence_group: recurrence_group,
        user: user,
        url: Faker::Internet.url,
      )
    end
  end
end
