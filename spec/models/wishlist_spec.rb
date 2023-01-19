require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:wishlist_products).dependent(:destroy) }
    it { should have_many(:products).through(:wishlist_products) }
  end
end
