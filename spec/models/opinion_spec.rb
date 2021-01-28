require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'check the opinion content' do
    it 'does not show error if have content' do
      opinion = Opinion.new
      opinion.content = 'comment opinion'
      opinion.valid?
      expect(opinion.errors[:content]).to_not include("can't be blank")
    end
    it 'shows error if have not content' do
      opinion = Opinion.new
      opinion.content = ''
      opinion.valid?
      expect(opinion.errors[:content]).to include("can't be blank")
    end
  end

  describe 'check associations' do
    it 'should belongs to user' do
      associations = Opinion.reflect_on_association(:user)
      expect(associations.macro).to eq(:belongs_to)
    end
  end
end
