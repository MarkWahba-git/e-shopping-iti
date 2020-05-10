# to run the seed --> rails db:seed

5.times do
  Category.create({
    category_name: Faker::Book.title
  })
end

5.times do
  Brand.create({
    brand_name: Faker::Book.title
  })
end

5.times do
  Store.create({
    store_name: Faker::Book.title,
    store_summary: Faker::Lorem.sentence,
    store_admin: Faker::Number.between(from: 1, to: 10)
  })
end
5.times do
  Order.create({
    buyer_id: Faker::Number.between(from: 1, to: 10),
    order_status: Faker::Book.title,
    order_total_price: Faker::Number.decimal(l_digits: 2)
    
  })
end
5.times do
  LineItem.create({
    order_id: 1,
    product_name: Faker::Book.title,
    product_qty: Faker::Number.between(from: 1, to: 10)
    
  })
end