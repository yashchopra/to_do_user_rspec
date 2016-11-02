FactoryGirl.define do
  factory :task do
    name "buy beer"
    priority 2

    factory :vote do
      name 'vote'
      priority 1
    end

    factory :invalid_task do
      name nil
      priority nil
    end
  end
end
