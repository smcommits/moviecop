require 'rails_helper'

RSpec.describe Opinion, type: :model do
   let(:user) {User.create(username: "Some", fullname:"Someone")}
  let(:opinion) {user.opinions.create(text:"text")}

  context 'validations' do
    it { should validate_presence_of(:text) }

  end

  context 'Assosations' do 
    it { should belong_to(:user) }
  end

  context "instance methods" do
    describe "#user_fullname" do
      it "should return fullname of the opinion creator" do
      expect(opinion.user_fullname).to eql("Someone")
      end
    end
  end


end
