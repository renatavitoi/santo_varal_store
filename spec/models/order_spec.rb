require 'rails_helper'
describe Order do
  context "when order gets create" do
    let(:product) { Product.create!(name: "Anything", description: "Anything", image_url: "Anything", colour: "Anything", price: 10) }
    let(:user)  { User.create!(email: "santovaralstore@gmail.com", password: "password")}

    it "order not valid without a user" do
      expect(Order.new(user_id: nil, product: product, total: 10)).not_to be_valid
    end

    it "order not valid without a product" do
      expect(Order.new(user_id: nil, product: product, total: 10)).not_to be_valid
    end
  end
end
