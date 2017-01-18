FactoryGirl.define do
  factory :tool do
    name 'Atom'
    factory :invalid_tool do
      name nil
    end
  end
end
