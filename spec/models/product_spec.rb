require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "santovaralstore@gmail.com", password: "password") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expected = 3
      average = product.average_rating()
      expect(average).to eq expected
    end

    it "returns the highst rating comment" do
      expected = 5
      comment = product.highest_rating_comment();
      expect(comment.rating).to eq expected
    end

    it "returns the lowest rating comment" do
      expected = 1
      comment = product.lowest_rating_comment();
      expect(comment.rating).to eq expected
    end

  end

  context "when the product has only description" do
    let(:product) { Product.new(description: "Nice bike") }

    it "returns a product invalid" do
      expect(product).not_to be_valid
    end

  end
end