# if Rails.env.development?
#   5.times do
#     user = User.create(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       email: Faker::Internet.email,
#     )
#     2.times do
#       recurrence_group = RecurrenceGroup.create(
#         user: user,
#         name: Faker::Game.title,
#       )
#       3.times do
#         RecurrenceRule.create(
#           recurrence_group: recurrence_group,
#           day_of_week: RecurrenceRule.day_of_weeks.keys.sample,
#           frequency: "1 week",
#           start_time: "03:00",
#           end_time: "21:00",
#         )
#       end
#       5.times do
#         LinkSubscription.create(
#           recurrence_group: recurrence_group,
#           user: user,
#           url: Faker::Internet.url,
#         )
#       end
#     end
#   end
# end

# if Rails.env.production?
  jay = User.create!(
    first_name: "Jay",
    last_name: "Quigley",
    email: "jayqui@outlook.com",
  )

  ca_news = RecurrenceGroup.create!(
    user: jay,
    name: "California News",
  )

  RecurrenceRule.day_of_weeks.each do |day_of_week, _|
    RecurrenceRule.create!(
      recurrence_group: ca_news,
      day_of_week: day_of_week,
      start_time: Time.zone.now.midnight,
      end_time: Time.zone.now.end_of_day,
    )
  end

  [
    'http://capitolweekly.net/',
    'http://www.sacbee.com/news/politics-government/',
    'http://www.latimes.com/politics/essential/',
    'http://www.mercurynews.com/news/politics/',
    'https://www.kqed.org/radio/program/forum',
    'https://www.kqed.org/news/tag/tcrarchive',
  ].each do |url|
    LinkSubscription.create!(
      recurrence_group: ca_news,
      url: url,
    )
  end
# end
