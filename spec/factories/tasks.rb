FactoryBot.define do
  factory :task do
    sequence(:title){ |n| "task#{n}" }
    status :todo
    association :owner
  end
end
