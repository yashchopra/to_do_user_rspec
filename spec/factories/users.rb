FactoryBot.define do
  factory :user do
    firstname {FFaker::Name::first_name}
    lastname {FFaker::Name::last_name}
    email {FFaker::Internet::email}

    after(:build) do |user|
      [:vote, :learn_guitar].each do |task|
        user.tasks << FactoryBot.build(task, user_id: user)
      end
    end
  end
end
