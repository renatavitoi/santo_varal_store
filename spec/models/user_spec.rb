require 'rails_helper'

describe User do
  context "when the user has not email and password" do
    let(:user) { FactoryBot.build(:user, email: "not_an_email") }

    it "returns a user invalid" do
      expect(user).not_to be_valid
    end

  end
end