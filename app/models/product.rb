class Product < ApplicationRecord
    validates :product_name, presence: true
end
