require 'rails_helper'

RSpec.feature 'Befor Action', type: :feature do
  let(:user) { User.create(username: 'Bill', fullname: 'Bill Hader') }
  scenario "User won't be able to visit the root path unless logged in and will be redirected to login page" do
    visit '/'
    expect(page).to have_current_path(login_path)
  end

  scenario 'User can visit the root_path after logging in' do
    visit '/'

    fill_in 'Username', with: user.username
    click_button('commit')
    expect(page).to have_current_path(root_path)
  end
end
