require 'rails_helper'

RSpec.describe OrderItemsController, :type => :controller do
  let(:product) { create(:product) }
  let(:params) { { product_id: product.id } }

  describe 'POST create' do
    context 'if users signed in' do
      it 'add that product in session if product not available in session' do
        post :create, params: params

        expect(response).to have_http_status(:found)
        expect(flash.notice).to eq('Order_items was successfully created.')
      end

      it 'it increase quantity if product is already available in session' do
        session[:product] = [product.id]
        session[:quantity] = [1]
        post :create, params: params

        expect(response).to have_http_status(:found)
        expect(flash.notice).to eq('Order_items was successfully created.')
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:payload_params) { { id: 0 } }

    it 'its deleting a product if product available in session' do
      session[:product] = [product.id]
      session[:quantity] =  [2]
      delete :destroy, params: payload_params

      expect(response).to have_http_status(:found)
    end

    it 'its not deleting a product if product available in session' do
      session[:product] = [product.id]
      delete :destroy, params: payload_params

      expect(response).to have_http_status(:found)
      expect(flash.alert).to eq('There was an error while deleting the item')
    end
  end

  describe 'PATCH /update' do
    let(:payload_params) { { id: product.id } }

    it 'its updating a product if user signed in' do
      session[:product] = [product.id]
      session[:quantity] =  [2]
      patch :update, params: payload_params

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(carts_path)
    end
  end
 end
