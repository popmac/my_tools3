FactoryGirl.define do
  factory :tool do
    name 'Atom'
    factory :invalid_tool do
      name nil
    end
  end
  FactoryGirl.modify do
    factory :review, class: Review do
      review '最高'
      rate 80
      likes_count 2
      tool_id 1
      user_id 1
    end
  end
end
