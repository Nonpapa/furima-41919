class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number,
                :item_id, :user_id, :token

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, :item_id, :user_id, :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
