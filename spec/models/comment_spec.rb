require 'rails_helper'

describe Comment do
  context "when a comment gets created" do
    let(:product) { Product.create!(name: "Anything", description: "Anything", image_url: "Anything", colour: "Anything", price: 10 ) }
    let(:user) { User.create!( email: "santovaralstore@gmail.com", password: "password") }

    before do
      product.comments.create!(rating: 3, user: user, body: "comment")
    end

    it "comment not valid without a user_id" do
      expect(Comment.new(user_id: nil, body: "This is an awesome bike")).not_to be_valid
    end
    it "comment not valid withou a body" do
      expect(Comment.new(body: "", user: user, product: product, rating: 2)).not_to be_valid
    end
    it "comment not valid without a rating" do
      expect(Comment.new(id: nil, user_id: 1, body: "Great Bike", user: user, product_id: 1)).not_to be_valid
    end

    it "is not valid withou a product_id" do
      expect(Comment.new(product_id: nil)).not_to be_valid
    end

  end

end
