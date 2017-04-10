FactoryGirl.define do

  factory :line_item do 
    association :product
    association :cart

    quantity 1
    price { Faker::Commerce.price }
  end
end