class Store < ApplicationRecord
  validates :store_name, presence: true
  validates :store_summary, presence: true
end
