# frozen_string_literal: true

module CheckoutsHelper
  def make_order
    order = Order.new(subtotal: session[:subtotal], status: 'paid', user_id: current_user.id)
    session[:product].each_with_index do |product, index|
      order.order_items.new(product_id: product.to_i, quantity: session[:quantity][index].to_i)
    end
    order.save
  end
end
