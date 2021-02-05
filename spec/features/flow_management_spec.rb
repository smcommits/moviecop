# frozen_string_literal: true

require 'rails_helper'

def sign_in_as(user)
  visit '/login'
  fill_in 'Username', with: user.username
  click_button('commit')
end

RSpec.feature 'Login', type: :feature do
  let(:user) { User.create(username: 'Mike', fullname: 'Mike Tyson') }
  let(:user2) { User.create(username: 'Mat', fullname: 'Mat Deamon') }

  scenario 'checking overall flow of opinion' do
    sign_in_as(user)

    fill_in 'opinion', with: 'Test Opinion'
    click_button('commit')
    expect(page).to have_content('Opinion Submitted')
    expect(page).to have_current_path(user_path(user.id))
  end
end
