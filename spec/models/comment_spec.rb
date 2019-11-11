require 'rails_helper'

describe Comment do
  context "when the Comment is be constructed without user and product" do
    let(:comment) { Comment.new() }

    it "returns a Comment invalid" do
      expect(comment).not_to be_valid
    end

  end
end