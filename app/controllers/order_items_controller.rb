# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_session, only: %i[create update destroy]
  before_action :set_item, only: %i[update]
  before_action :set_product, only: %i[destroy]
  before_action :set_order, only: %i[create]

  def create
    session[:subtotal] = calculate_subtotal
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Order_items was successfully created.' }
      format.json { redirect_to products_path, notice: 'Order_items was successfully created.'}
    end
  end

  def update
    decreased_subtotal
    session[:quantity], session[:subtotal] = update_session
    redirect_to carts_path
  end

  def destroy
    if quantity_check(@quantity) && product_check(params[:id].to_i)
      session[:size], session[:subtotal] = destroy_items
    else
      flash['alert'] = 'There was an error while deleting the item'
    end
    redirect_to carts_path
  end

  private

  def quantity_check(quantity)
    !quantity.nil?
  end

  def product_check(arg)
    !session[:product].delete_at(arg).nil?
  end

  def decreased_subtotal
    @index = session[:product].index(params[:id].to_i)
    session[:subtotal] -= @product.price * session[:quantity][@index]
  end

  def set_product
    @product = Product.find(session[:product][params[:id].to_i])
    @quantity = session[:quantity].delete_at(params[:id].to_i)
  end

  def set_item
    @product = Product.find(params[:id])
  end

  def set_session
    session[:product] ||= []
    session[:quantity] ||= []
    session[:subtotal] ||= 0
    session[:size] ||= 0
    @order_obj = OrderItems.new
  end

  def set_order
    if !session[:product].include?(params[:product_id].to_i)
      increased_product_size
    else
      session[:quantity] = quantity_decreased
    end
  end

  def increased_product_size
    session[:product], session[:quantity] = quantity_increased
    session[:size] = @order_obj.call('size', session[:size])
  end

  def quantity_decreased
    @order_obj.call('decrease', session[:product], session[:quantity], params[:product_id].to_i, params[:quantity].to_i)
  end

  def quantity_increased
    @order_obj.call('increase', session[:product], session[:quantity], params[:product_id].to_i, params[:quantity].to_i)
  end

  def update_session
    @order_obj.call('update_sub', session[:quantity], @index, params[:quantity].to_i, session[:subtotal],
                    @product.price)
  end

  def calculate_subtotal
    @order_obj.call('cal_sub', session[:subtotal], params[:product_id], params[:quantity].to_i)
  end

  def destroy_items
    @order_obj.call('remove', session[:size], session[:subtotal], @product.price, @quantity)
  end
end
