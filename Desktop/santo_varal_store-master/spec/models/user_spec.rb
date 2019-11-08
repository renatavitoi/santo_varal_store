require 'rails_helper'

describe User do
  context "When user gets created" do
    let(:user) { User.new(email: "test@santovaralstore@gmail.com")}
    it "user not valid without an email" do
      expect(user).not_to be_valid
    end
  end

  context "When user gets created" do
    let(:user) { User.new(password: "123456")}
    it "user not vaild without a password" do
      expect(user).not_to be_valid
    end
  end
end
