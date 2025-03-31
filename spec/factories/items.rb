FactoryBot.define do
  factory :item do
    association :user
    name                  { 'テスト商品' }
    description           { 'テスト説明' }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id         { 2 }
    scheduled_delivery_id { 2 }
    price                 { 1000 }

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
