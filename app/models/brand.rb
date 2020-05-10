class Brand < ApplicationRecord
  validates :brand_name, presence: true
end
