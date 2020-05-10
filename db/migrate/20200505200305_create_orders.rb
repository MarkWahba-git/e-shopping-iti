class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.string :order_status
      t.float :order_total_price
      t.timestamps
    end
  end
end
