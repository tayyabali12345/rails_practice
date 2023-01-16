# frozen_string_literal: true

module Paypal
  class CheckoutsController < ApplicationController
    include PayPal::SDK::REST
    before_action :set_payment, only: %i[create]

    def create
      @payment = Payment.new({
                               intent: 'sale',
                               payer: {
                                 payment_method: 'paypal'
                               },
                               redirect_urls: {
                                 return_url: complete_paypal_checkouts_url,
                                 cancel_url: products_url
                               },
                               transactions: [
                                 {
                                   amount: {
                                     total: session[:subtotal],

                                     currency: 'USD'
                                   },
                                   description: 'Product has been purchased'
                                 }
                               ]
                             })
      deliver_email
    end

    def deliver_email
      if @payment.create
        make_email(@payment)
      else
        redirect_to products_url, alert: 'Something went go wrong, please try again'
      end
    end

    def complete
      payment = Payment.find(params[:paymentId])
      if payment.execute(payer_id: params[:PayerID])
        store_order
        redirect_to root_url, notice: 'Thanks for Purchasing!'
      else
        redirect_to products_url, alert: 'There was error while processing your request'
      end
    end

    def make_email(payment)
      redirect_url = payment.links.find { |v| v.rel == 'approval_url' }.href
      ProductMailer.order_created(current_user.order.id).deliver_now
      redirect_to redirect_url
    end

    private

    def set_payment
      if current_user.nil?
        redirect_to new_user_session_url, alert: 'You must be logged in to continue'
      else
        @price = if current_user.bonus == 'true'
                   session[:subtotal] - (session[:subtotal] * 0.05)
                 else
                   session[:subtotal]
                 end
        save_user
      end
    end

    def store_order
      reset_session
    end

    def save_user
      current_user.bonus = 'false'
      current_user.save
      helpers.make_order
    end
  end
end
