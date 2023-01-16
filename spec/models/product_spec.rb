require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Product, type: :model do
  let!(:product) { create(:product) }
  describe 'associations' do
    it { should have_many(:wishlist_products).dependent(:destroy) }
    it { should have_many(:wishlists).through(:wishlist_products) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many_attached(:images) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) && validate_numericality_of(:price).is_greater_than(0).is_less_than(1000) }

    context 'image validations' do
      it 'expects object to be invalid if content type is invalid' do
        product.images = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/App.js")

        expect(product).to be_invalid
      end

      it 'expects object to be valid if content type is valid' do
        product.images = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/tayyab.jpeg")

        expect(product).to be_valid
      end

      it 'expects object to be invalid if size image is larger' do
        product.images = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/panther.png")

        expect(product).to be_invalid
        expect(product.errors.messages[:images]).to eq(["The size of image should be less than less_than: 1.megabytes"])
      end
    end
  end
end
