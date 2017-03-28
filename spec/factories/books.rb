FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyString"
    price 1.5
    association :user
    in_stock 10
    association :categories
  end
end
