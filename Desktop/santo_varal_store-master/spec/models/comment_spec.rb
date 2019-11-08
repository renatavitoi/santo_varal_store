require 'rails_helper'

describe Comment do
  context "when comment gets created" do
    let(:product) { Product.create!(name: "Anything", description: "Anything", image_url: "Anything", colour: "Anything", price: 10) }
    let(:user) { User.create!(email: "test@santovaralstore.com", password: "123456") }

    before do
      product.comments.create!(rating: 3, user: user, body: comment)
    end

    it "comment not valid without a user" do
      expect(Comment.new(user_id: nil, boby: "This is a great eyeshadow")).not_to be_valid
    end

    it "comment not valid without a body" do
      expect(Comment.new(body: nil, user: user, product: product, rating: 3)).not_to be_valid
    end

    it "comment not valid without rating" do
      expect(Comment.new(body: "Great", user: user, product: product, rating: nil)).not_to be_valid
    end

    it "not valid with product_id" do
      expect(Comment.new(product_id: nil)).not_to be_valid
    end
  end
end
