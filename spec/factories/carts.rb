FactoryGirl.define do

  factory :cart do 
  end

  trait :with_line_items do
    transient do
      number_of_line_items 5
    end

    after(:create) do |evaluator|
      create_list(:line_item, evaluator.number_of_line_items)
    end
  end
end