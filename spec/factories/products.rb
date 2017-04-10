FactoryGirl.define do

  factory :product do 
    title { Faker::Commerce.product_name }
    description { Faker::Name.last_name }
    price { Faker::Commerce.price }
    image_url { Faker::Placeholdit.image("200x200", 'jpg') }
  end
end