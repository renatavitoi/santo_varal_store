require 'rails_helper'

describe Product do
  context "When the product has comments"
  let(:product) { Product.create!(name: "eyeshadow") }
  let(:user) { User.create!(email: "test@santovaralstore.com", password: "123456" ) }

  before do
    product.comments.create(rating: 1, user: user, body: "Awful eyeshadow!")
    product.comments.create!(rating: 3, user:user, body: "Ok eyeshadow!")
    product.comments.create!(rating: 5, user: user, body: "Great eyeshadow!")

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

  context "When the products get created" do
    let(:product) { Product.new(name: "Anything", description: "Anything", image_url: "Anything", colour: "Anything", price: 10) }

    it "is new record with valid attributes" do
      expect(Product.new).to be_new_record
    end
  end

  context "when product gets create" do
    let!(:product) { Product.new(name: nil, description: "Anything", image_url: "Anything", colour: "Anything", price: 10) }

    it "is not a valid without name" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when product gets created" do
    let(:product) { Product.new(name: "Anything", description: nil, image_url: "Anything", colour: "Anything", price: 10) }

    it "is not valid without a description" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when a product get create" do
    let(:product) { Product.new(name: "Anything", description: "Anything", image_url: nil, colour: "Anything", price: 10) }
    it "is not valid without an image" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when a product get create" do
    let(:product) { Product.new(name: "Anything", description: "Anything", image_url: "Anything", colour: nil, price: 10) }

    it "is not valid without a colour" do
      expect(Product.new).not_to be_valid
    end
  end

  context "when a product get create" do
    let(:product) { Product.new(name: "Anything", description: "Anything", image_url:
      "Anything", colour: "Anything", price: nil) }

      it "is not valid without a price" do
        expect(Product.new).not_to be_valid
      end
    end
  end
