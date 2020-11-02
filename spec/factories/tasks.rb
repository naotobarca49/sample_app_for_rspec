FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "title#{n}" }
    content { "test content" }
    deadline { "1.week.from.now" }
    status { :todo }
    association :user
  end
end
