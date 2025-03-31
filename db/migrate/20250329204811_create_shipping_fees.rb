class CreateDeliveryFees < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_fees do |t|

      t.timestamps
    end
  end
end
