require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.create(username: "Test", fullname:"Tester")}
  let(:user2) {User.create(username: "Test2", fullname:"Tester2")}
  let(:example_user) {User.create(username: "Ex", fullname: "Example")}

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:fullname) }

  end

  context 'Assosations' do 
    it { should have_many(:users_they_followed)}
    it { should have_many(:followings)}
    it { should have_many(:following_users)}
    it { should have_many(:followers)}
    it { should have_many(:opinions) }
  end

  context 'instance methods' do
    
    describe "#following_count" do
      it "should return the count of users that a user is following" do
        count = user.following_count 
        expect(count).to eql(0)
      end

      it "should return the count of following users" do
        Following.create(follower_id: user.id, followed_id: user2.id)
        count = user.following_count
        expect(count).to eql(1)
      end
    end

end

