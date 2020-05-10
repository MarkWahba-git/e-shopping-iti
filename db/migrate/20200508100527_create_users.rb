class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :age
      t.string :city
      t.string :address
      t.string :is_Admin , :default => '0'
      t.string :is_seller, :default => '0'
      t.string :is_buyer , :default => '0'
      t.string :is_guest , :default => '1'

    
      

      t.timestamps
    end
  end
end
