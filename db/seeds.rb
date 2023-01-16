# frozen_string_literal: true

User.create(email: 'usama@gmail.com', first_name: 'usman', last_name: 'ali', password: '123456')
User.create(email: 'omer@gmail.com', first_name: 'omer', last_name: 'ali', password: '123456')
User.create(email: 'khan@gmail.com', first_name: 'khan', last_name: 'ali', password: '123456')

Product.create(name: 'ColdDrink', description: 'Chilled Bear', price: 25, user_id: User.last.id)
Product.create(name: 'Halwa', description: 'Sweet Dish', price: 15, user_id: User.last.id)
Product.create(name: 'Soji', description: 'Chilled Bear', price: 25, user_id: User.first.id)

Order.create(subtotal: 200.0, total: 200.0, status: 'unpaid', user_id: User.last.id)
Order.create(subtotal: 200.0, total: 200.0, status: 'unpaid', user_id: User.first.id)

OrderItem.create(quantity: 2, product_id: Product.first.id, order_id: Order.first.id, total: 10.0)
OrderItem.create(quantity: 4, product_id: Product.last.id, order_id: Order.first.id, total: 20.0)

Comment.create(description: 'Amazing Product! Good to purchase', user_id: User.first.id, product_id: Product.first.id)
Comment.create(description: 'Discusting Product! Bad to purchase', user_id: User.last.id, product_id: Product.last.id)
