FactoryBot.define do
  factory :order_form do
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    city            { '札幌市' }
    address         { '南1条' }
    building        { 'さっぽろビル' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
