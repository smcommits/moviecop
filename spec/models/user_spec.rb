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

    describe "#followers_count" do

      it "should return all the followers of a user" do
        user2.users_they_followed.create(followed_id: user.id)
        count = user.followers_count
        expect(count).to eql(1)
      end
    end

    describe "#opinions_from_followings" do
      
      it "should return all the opinions from users that a user is following" do
        user.opinions.create(text: "Test Opinion")
        user2.users_they_followed.create(followed_id: user.id)
        opinions = user2.opinions_from_followings
        expect(opinions.first).to eql(user.opinions.first)
      end

      it "should return opinions in DESC order" do
        first_op = user.opinions.create(text: "Test Opinion")
        second_op = user.opinions.create(text: "Test Opinion 2")
        user2.users_they_followed.create(followed_id: user.id)
        opinions = user2.opinions_from_followings
        expect(opinions.first).to eql(user.opinions.second)
      end
    end

 
  end
end

