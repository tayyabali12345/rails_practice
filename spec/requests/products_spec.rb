require 'rails_helper'

RSpec.describe 'Products', type: :request do
    let!(:user) { create(:user) }
    let!(:product) { create(:product, user_id: user.id) }
    let(:valid_params) { { name: 'tyota', price: 500, description: 'Driving Car', images: [] } }
    let(:invalid_params) { { name: '', price: 1, description: '', images: [] } }
    let(:fake_id) { Faker::IDNumber.invalid }

    before do
      sign_in user
    end

    describe 'GET /index' do
      it 'returns a success response with no wishlist' do
        get products_path

        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'returns a success response with wishlist' do
        user.wishlist = Wishlist.new
        get products_path

        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET /show' do
      context 'if user signs in' do
        it 'returns a success response if product id find ' do
          get product_path(product.id)

          expect(response).to be_success
          expect(response).to render_template(:show)
        end

        it 'it does not find a product if product id not found' do
          get product_path(fake_id)

          expect(response).not_to be_success
          expect(response).to redirect_to(root_path)
        end
      end

      it 'returns a success if signed out' do
        sign_out user
        get product_path(product.id)

        expect(response).to be_success
        expect(response).to render_template(:show)
      end
    end

    describe 'GET /new' do
      it 'should return a new product' do
        get new_product_path

        expect(assigns(:product)).to be_a_new(Product)
      end
    end

    describe 'GET /edit' do
      context 'when user signed in' do
        it 'edits a product' do
          get edit_product_path(product.id)

          expect(response).to be_successful
          expect(response).to render_template(:edit)
        end

        it 'does not edits a product' do
          get edit_product_path(fake_id)

          expect(response).not_to be_success
          expect(response).to redirect_to(root_path)
        end
      end
    end

    describe 'PRODUCT /create' do
      context 'when user signs in' do
        it 'creates a product if validation pass' do

          expect { post products_path, params: valid_params, as: :json }.to change { Product.count }.by(1)
        end

        it 'does not create product if validation fails' do

          expect { post products_path, params: invalid_params, as: :json }.to change { Product.count }.by(0)
        end
      end
    end

    describe 'PATCH /update' do
      context 'user signed in' do
        it 'updates a product if validation pass ' do
          patch product_path(product.id), params: product, as: :json

          expect(response).to have_http_status(:ok)
          expect(response).to be_successful
        end

        it 'does not update product if validation fails' do

          expect { put product_path(product.id), params: invalid_params, as: :json }.to change { Product.count }.by(0)
        end
      end
    end

    describe 'DELETE /destroy' do
      context 'User is signed in' do
        it 'delete a product if product found' do

          expect { delete product_path(product.id) }.to change { Product.count }.by(-1)
          expect(response).to redirect_to(products_path)
        end

        it 'does not delete product if product not found' do

          expect { delete product_path(fake_id) }.to change { Product.count }.by(0)
          expect(response).to redirect_to(root_path)
        end

        it 'does not delete product if delete fails' do
          allow_any_instance_of(Product).to receive(:destroy).and_return(false)

          expect { delete product_path(product.id) }.to change { Product.count }.by(0)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
