require 'rails_helper'

RSpec.describe User, type: :model do

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

end

