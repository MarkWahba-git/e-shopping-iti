class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.blob :image
      t.float :price
      t.float :in-stock
      t.string :category
      t.string :brand

      t.timestamps
    end
  end
end
