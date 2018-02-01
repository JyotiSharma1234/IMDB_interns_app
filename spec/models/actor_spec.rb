require 'rails_helper'

RSpec.describe Actor do
  context 'Actor validation' do
    it 'should valid actor' do
      actor = FactoryGirl.create(:actor)
      expect(actor.valid?).to eq(true)
    end
  end

  context 'name validation' do
    it 'has invalid name' do
      actor = FactoryGirl.build(:actor, :name => '')
      expect(actor.valid?).to eq(false)
    end
  end

  context 'birth date validation' do
    it 'has invalid birth date' do
      actor = FactoryGirl.build(:actor, :date_of_birth => '')
      expect(actor.valid?).to eq(false)
    end
  end

  context 'description validation' do
    it 'has invalid description' do
      actor = FactoryGirl.build(:actor, :description => 'm')
      expect(actor.valid?).to eq(false)
    end
  end
  
end
