require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do

  let(:user){User.new(username: "Test", fullname: "Test Me")}

  describe "#current_user" do
    
    it "returns nil if current_user doesn't exist" do
      user = current_user
      expect(user).to eql(nil)
    end

    it "returns the current_user is user is logged in" do
      visit '/login'

      test_user = current_user
      expect(test_user).to eql(user)
    end
  end
end
