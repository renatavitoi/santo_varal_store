require 'rails_helper'

describe Comment do

  context "when the comment has user, product and body" do
    let(:product) { Product.create!(name: "race bike", colour: "white", description: "awesome bike", price: 200) }
    let(:user) { User.create!(email: "santovaralstore@gmail.com", password: "password") }

    before do
      Comment.create!(user: user, product: product, body: "great!", rating: 1)
      Comment.create!(user: user, product: product, body: "great!", rating: 9)
      Comment.create!(user: user, product: product, body: "great!", rating: 5)
    end


    it "returns all comments order by rating_desc" do
      comments = Comment.rating_desc();
      expect(comments[0].rating).to eq 9
      expect(comments[1].rating).to eq 5
      expect(comments[2].rating).to eq 1
    end

    it "returns all comments order by rating_asc" do
      comments = Comment.rating_asc();
      expect(comments[0].rating).to eq 1
      expect(comments[1].rating).to eq 5
      expect(comments[2].rating).to eq 9
    end
  end

  context "when a comment is create" do
    it "not valid without a user" do
      expect(Comment.new(user_id: nil, body: "This is a Text")).to_not be_valid
    end
  end

  it "not valid without a product_id" do
    expect(Comment.new(product_id: nil, body: "This is a text")).to_not be_valid
  end

  it "not valid without a body" do
    expect(Comment.new(body:nil)).not_to be_valid
  end
end
