# frozen_string_literal: true

# PostSerializer
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :product_images_list

  def product_images_list
    product_images = []
      object&.images&.each_with_index do |_image, index|
        product_images.push(object.images[index].service_url)
      end
    product_images
  end

end
