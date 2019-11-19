
require 'rails_helper'

describe User do
  context "when a user gets created" do
    let(:user) { User.new(password: "password") }
    it "user not valid withou an email" do
      expect(user).not_to be_valid
    end
  end

  context "when a user gets created" do
    let(:user) { User.new(email: "santovaralstore@gmail.com") }
    it "user not valid withou and email" do
      expect(user).not_to be_valid
    end
  end
end
