FactoryBot.define do
  factory :show do
    title { Faker::Lorem.words(3).join(' ').titleize }
    description { Faker::Lorem.paragraph }
    ave_score { Faker::Number.decimal(2,1) }
    review_count { Faker::Number.number(3) }
  end
end

