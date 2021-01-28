require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'check the username' do
    it 'does not show error if username is valid' do
      user = User.new
      user.username = 'user name'
      user.valid?
      expect(user.errors[:username]).to_not include("can't be blank")
    end
    it 'shows error if username is empty' do
      user = User.new
      user.username = ''
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end
    it 'shows error if username is too long' do
      user = User.new
      user.username = 'namewithmorethan20characters'
      user.valid?
      expect(user.errors[:username]).to include('is too long (maximum is 20 characters)')
    end
  end

  describe 'check the user fullname' do
    it 'does not show error if username is valid' do
      user = User.new
      user.fullname = 'user name'
      user.valid?
      expect(user.errors[:fullname]).to_not include("can't be blank")
    end
    it 'shows error if fullname is empty' do
      user = User.new
      user.fullname = ''
      user.valid?
      expect(user.errors[:fullname]).to include("can't be blank")
    end
    it 'shows error if fullname is too long' do
      user = User.new
      user.fullname = 'namewithmorethan20characters'
      user.valid?
      expect(user.errors[:fullname]).to include('is too long (maximum is 20 characters)')
    end
  end

  describe 'check the email' do
    it 'shows error if email field is empty' do
      user = User.new
      user.email = ''
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'does not show error if email field is not empty' do
      user = User.new
      user.email = 'test@email.com'
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end
  end

  describe 'check associations' do
    it 'should have many opinions' do
      associations = User.reflect_on_association(:opinions)
      expect(associations.macro).to eq(:has_many)
    end
    it 'should have many followings' do
      associations = User.reflect_on_association(:followings)
      expect(associations.macro).to eq(:has_many)
    end
    it 'should have many followeds' do
      associations = User.reflect_on_association(:followeds)
      expect(associations.macro).to eq(:has_many)
    end
    it 'should have many followers' do
      associations = User.reflect_on_association(:followers)
      expect(associations.macro).to eq(:has_many)
    end
  end
end
