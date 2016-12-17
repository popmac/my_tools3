FactoryGirl.define do
  factory :user, class: User do
    username 'test_user'
    email 'test@example.com'
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
