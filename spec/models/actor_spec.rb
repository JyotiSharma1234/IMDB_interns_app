require 'rails_helper'

RSpec.describe Actor do
  context 'Actor' do
    it 'is a valid actor' do
      actor = FactoryGirl.create(:actor)
      expect(actor.valid?).to eq(true)
    end
  end

  context 'name' do
    it 'is blank' do
      actor = FactoryGirl.build(:actor, :name => '')
      actor.valid?
      expect(actor.errors['name']).to eq(["can't be blank", "Invalid"])
    end

    it 'has invalid name with numbers' do
      actor = FactoryGirl.build(:actor, :name => '33aa')
      actor.valid?
      expect(actor.errors['name']).to eq(["Invalid"])
    end
  end

  context 'birth date' do
    it 'has blank birth date' do
      actor = FactoryGirl.build(:actor, :date_of_birth => '')
      actor.valid?
      expect(actor.errors['date_of_birth']).to eq(["can't be blank"])
    end

    it 'has valid date' do
      actor = FactoryGirl.build(:actor)
      expect(actor.validate_date_of_birth).to eq(nil)
    end

    it "has invalid date(date from future)" do
      actor = FactoryGirl.build(:actor, date_of_birth: '10-10-2020')
      expect(actor.validate_date_of_birth).to eq(['Date from future not allowed'])
    end
  end

  context 'description' do
    it 'is invalid ' do
      actor = FactoryGirl.build(:actor, :description => 'm')
      actor.valid?
      expect(actor.errors['description']).to eq(["is too short (minimum is 5 characters)"])
    end
  end

  context 'search' do
    it 'returns all matched actors' do
      actor = FactoryGirl.create(:actor, name: 'Pooja')
      expect(Actor.search('Pooja')).to eq([actor])
    end
  
    it 'returns empty array for non-existent Actor' do
      expect(Actor.search('Jyoti')).to eq([])
    end
  end
end
