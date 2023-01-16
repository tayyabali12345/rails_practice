module Api
  module V1
    # Api for PostsController
    class ProductsController < ApiController
      before_action :find_product, only: %i[show]

      def index
        @products = Product.all
        render json: @products
      end

      def show
        if @product.nil?
          render json: nil, status: :not_found
        else
          render json: @product, status: :ok
        end
      end

      def find_product
        @product = Product.find(params[:id])
      rescue RecordNotFound
        flash['alert'] = 'Sorry product was not found. Please try again'
        redirect_to root_path
      end

    end
  end
end
