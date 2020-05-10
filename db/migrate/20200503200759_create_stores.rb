class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :store_summary
      t.integer :store_admin
      t.timestamps
    end
  end
end
