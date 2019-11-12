require 'rails_helper'

describe Order do
  context "when the order is be constructed without user and product" do
    let(:order) { Order.new() }

    it "returns a order invalid" do
      expect(order).not_to be_valid
    end

  end
end