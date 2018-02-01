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
      actor.valid?
      expect(actor.errors['name']).to eq(["can't be blank", "Invalid"])
    end
  end

  context 'birth date validation' do
    it 'has invalid birth date' do
      actor = FactoryGirl.build(:actor, :date_of_birth => '')
      actor.valid?
      expect(actor.errors['date_of_birth']).to eq(["can't be blank"])
    end
  end

  context 'description validation' do
    it 'has invalid description' do
      actor = FactoryGirl.build(:actor, :description => 'm')
      actor.valid?
      expect(actor.errors['description']).to eq(["is too short (minimum is 5 characters)"])
    end
  end

  context 'search' do
    it 'should return all matched actors' do
      actor = FactoryGirl.create(:actor, name: 'Pooja')
      expect(Actor.search('Pooja')).to eq([actor])
    end
  end

  context 'date_of_birth' do
    it 'has valid date' do
      actor = FactoryGirl.build(:actor)
      expect(actor.validate_date_of_birth).to eq(nil)
    end

    it "has invalid date(date from future)" do
      actor = FactoryGirl.build(:actor, date_of_birth: '10-10-2020')
      expect(actor.validate_date_of_birth).to eq(['Date from future not allowed'])
    end
  end


  context 'search validation' do
    it 'should return empty array for non-existent Actor' do
      expect(Actor.search('Jyoti')).to eq([])
    end
  end
end
