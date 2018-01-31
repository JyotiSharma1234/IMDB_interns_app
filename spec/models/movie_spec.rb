require 'rails_helper'

RSpec.describe Movie do
  context 'Movie validation' do
    it 'should valid movie' do
      movie = FactoryGirl.create(:movie)
      expect(movie.valid?).to eq(true)
    end
  end

  context 'name validation' do
    it 'has invalid name' do
      movie = FactoryGirl.build(:movie, :name => '')
      expect(movie.valid?).to eq(false)
    end
  end

  context 'release date validation' do
    it 'has invalid release date' do
      movie = FactoryGirl.build(:movie, :release_date => '')
      expect(movie.valid?).to eq(false)
    end
  end

  context 'description validation' do
    it 'has invalid description' do
      movie = FactoryGirl.build(:movie, :description => 'm')
      expect(movie.valid?).to eq(false)
    end
  end

  context 'rating validation' do
    it 'has invalid rating' do
      movie = FactoryGirl.build(:movie, :rating => 6)
      expect(movie.valid?).to eq(false)
    end
  end
end
