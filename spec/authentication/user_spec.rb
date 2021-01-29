require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'check if user name is valid' do
    it 'save a new user if user name is valid' do
      visit new_user_path
      fill_in 'user_username', with: 'User'
      fill_in 'user_fullname', with: 'User Name'
      fill_in 'user_email', with: 'user@email.com'
      find("input[type='submit']").click
      expect(page).to have_content('User was successfully created.')
    end

    it 'do not save a new user if username is invalid' do
      visit new_user_path
      fill_in 'user_username', with: 'Us'
      fill_in 'user_fullname', with: 'User Name'
      fill_in 'user_email', with: 'user@email.com'
      find("input[type='submit']").click
      expect(page).to have_content('Username is too short')
    end

    it 'do not save a new user if user is already created' do
      User.create(username: 'User', fullname: 'full name', email: 'user@email.com', photo: 'avatar.png')
      visit new_user_path
      fill_in 'user_username', with: 'User'
      fill_in 'user_fullname', with: 'User Name'
      fill_in 'user_email', with: 'user@email.com'
      find("input[type='submit']").click
      expect(page).to have_content('Username has already been taken')
    end
  end
end