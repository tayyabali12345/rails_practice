require 'rails_helper'

RSpec.describe WishlistProduct, type: :model do
  describe 'associations' do
    it { should belong_to(:wishlist) }
    it { should belong_to(:product) }
  end
end
