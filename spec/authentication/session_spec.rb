require 'rails_helper'

RSpec.describe 'Session', type: :feature do
  describe 'check if login is valid' do
    it 'create a session if user exists' do
      User.create(username: 'User', fullname: 'full name', email: 'user@email.com', photo: 'avatar.png')
      visit new_session_path
      fill_in 'username', with: 'User'
      find("input[type='submit']").click
      expect(page).to have_content('Logged in!')
    end

    it 'not create a session if user does not exist' do
      User.create(username: 'User', fullname: 'full name', email: 'user@email.com', photo: 'avatar.png')
      visit new_session_path
      fill_in 'username', with: 'noUser'
      find("input[type='submit']").click
      expect(page).to have_content('Invalid user name')
    end
  end
end
