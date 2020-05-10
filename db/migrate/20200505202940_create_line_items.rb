class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.string :product_name
      t.integer :product_qty
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
