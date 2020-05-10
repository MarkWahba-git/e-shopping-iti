class Category < ApplicationRecord
  validates :category_name, presence: true
end
