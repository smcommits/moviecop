# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { User.create(username: 'Mike', fullname: 'Mike Tyson') }
  scenario 'Login user and redirect to welcome index page' do
    visit '/login'

    fill_in 'Username', with: user.username
    click_button('commit')

    expect(page).to have_current_path(root_path)
  end

  scenario 'It will failt o login when username is wrong' do
    visit '/login'

    fill_in 'Username', with: 'randomUsername'
    click_button('commit')

    expect(page).to have_current_path(login_path)
    expect(page).to have_content('Username Not Found!')
  end
end
