require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'check associations' do
    it 'should belongs to user' do
      associations = Following.reflect_on_association(:user)
      expect(associations.macro).to eq(:belongs_to)
    end
    it 'should belongs to follower' do
      associations = Following.reflect_on_association(:follower)
      expect(associations.macro).to eq(:belongs_to)
    end
  end
end
