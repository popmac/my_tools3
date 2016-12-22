FactoryGirl.define do
  factory :user, class: User do
    sequence(:username) { |n| "test_user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
    profile
  end
  FactoryGirl.modify do
    factory :profile, class: Profile do
      age '29'
      job 'web'
      introduce 'hello'
      avatar 'hoge.png'
      nickname 'mats'
    end
  end
end
