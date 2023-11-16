# frozen_string_literal: true

# db/seeds.rb

users = [
  { name: 'John', age: 30 },
  { name: 'Alice', age: 25 },
  { name: 'Bob', age: 28 }
]

users.each { |user| User.create(user) }

products = [
  { title: 'Product 1', author: 'Author A', user_id: User.first.id },
  { title: 'Product 2', author: 'Author B', user_id: User.second.id },
  { title: 'Product 3', author: 'Author C', user_id: User.first.id }
]

products.each { |product| Product.create(product) }
