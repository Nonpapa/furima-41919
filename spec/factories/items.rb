FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    price { 1 }
    category_id { 1 }
    status_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    user { nil }
  end
end
