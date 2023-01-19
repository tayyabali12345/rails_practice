# frozen_string_literal: true

class ProductMailer < ApplicationMailer
  def order_created(order_id)
    @greeting = 'Hi'
    email_id = []
    @user = Order.find(order_id).user
    @items = Order.find(order_id).order_items
    @items.each do |item|
      email_id.append(item.product.user.email)
    end
    email_id = email_id.uniq
    mail(
      to: email_id,
      subject: 'Details of Order'
    )
  end

  def price_updated(product)
    @product = product
    @product_wishlist = product.wishlists
    email_id = []
    @product_wishlist.each do |item|
      email_id.append(item.user.email)
    end
    email_id = email_id.uniq
    mail(
      to: email_id,
      subject: 'Price Changed'
    )
  end
end
