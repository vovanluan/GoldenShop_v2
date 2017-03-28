FactoryGirl.define do
  factory :book do
    title "This is a title"
    description "This is a book description"
    price 1.5
    user_id 1
    in_stock 10
  end
end
