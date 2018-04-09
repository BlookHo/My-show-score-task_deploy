# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Review.delete_all
Review.reset_pk_sequence

Show.delete_all
Show.reset_pk_sequence

20.times do
  show = Show.create!(
    title:  Faker::Lorem.words(3).join(' ').titleize,
    description: Faker::Lorem.paragraph
  )

  # create some number of reviews between 5 and 20
  (1..rand(5..25)).each do
    show.reviews.create!(
      critic_name: Faker::App.author,
      publication_name: "#{Faker::Lorem.words} " + ['Times', 'Journal', 'Inquirer', 'Daily'].sample,
      score: rand(0..100),
      body: Faker::Lorem.paragraph
    )
  end

  # Fill :review_count and :ave_value with calculated data
  # This should be done after every new review submit on the fly
  score_arr = show.reviews.pluck(:score)
  score_sum = score_arr.inject(:+)
  review_count = score_arr.size
  review_count > 0 ? ave_value = score_sum/review_count : ave_value = 0
  show.update(ave_score: ave_value.round(1), review_count: review_count)
end
