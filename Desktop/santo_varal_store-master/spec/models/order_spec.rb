require 'rails_helper'

describe Order do
  context "When order gets created" do
    let(:product) { Product.create!(name: "Anything", description: "Anything", image_url: "Anything", colour: "Anything", price: 10) }
    let(:user) { User.created!(email: "test@santovaralstore.com", password: "123456")}

    it "order not valid without a user" do
      expect(Order.new(user_id: "Anything", product: product, total: 10)).not_to be_valid
      it "order not valid without product" do
        expect(Order.new(user: user, product: nil, total: 10)).not_to be_valid
      end
    end
  end
end
