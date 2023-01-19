require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  describe 'associations' do
    it { should have_many(:products).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_one(:wishlist).dependent(:destroy) }
    it { should have_one(:order).dependent(:destroy) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    context 'image validations' do
      it 'expects object to be invalid if invalid file pass' do
        user.image = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/App.js")

        expect(user).to be_invalid
      end

      it 'expects object to be valid if valid file pass' do
        user.image = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/tayyab.jpeg")

        expect(user).to be_valid
      end

      it 'expects object to be invalid if size is larger' do
        user.image = Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/panther.png")

        expect(user).to be_invalid
        expect(user.errors.messages[:image]).to eq(['The size of image should be less than less_than: 1.megabytes'])
      end
    end
  end
end
