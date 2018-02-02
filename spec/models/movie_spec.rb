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
      movie.valid?
      expect(movie.errors['name']).to eq(["Field cannot be empty"])
    end
  end

  context 'release date validation' do
    it 'has invalid release date' do
      movie = FactoryGirl.build(:movie, :release_date => '')
      movie.valid?
      expect(movie.errors['release_date']).to eq(["Field cannot be empty"])
    end
  end

  context 'description validation' do
    it 'has invalid description' do
      movie = FactoryGirl.build(:movie, :description => 'm')
      movie.valid?
      expect(movie.errors['description']).to eq(["is too short (minimum is 6 characters)"])
    end
  end

  context 'rating validation' do
    it 'has invalid rating' do
      movie = FactoryGirl.build(:movie, :rating => 6)
      movie.valid?
      expect(movie.errors['rating']).to eq(["is not included in the list"])
      expect(movie.valid?).to eq(false)
    end


    it 'has invalid rating in decimal' do
      movie = FactoryGirl.build(:movie, :rating => 6.5)
      movie.valid?
      expect(movie.errors['rating']).to eq(["is not included in the list"])
      expect(movie.valid?).to eq(false)
    end

    it 'has valid rating in decimal' do
      movie = FactoryGirl.build(:movie, :rating => 3.5)
      movie.valid?
      expect(movie.errors['rating']).to eq([])
      expect(movie.valid?).to eq(true)
    end

    it 'has valid rating' do
      movie = FactoryGirl.build(:movie, :rating => 3)
      movie.valid?
      expect(movie.errors['rating']).to eq([])
      expect(movie.valid?).to eq(true)
    end
  end


  context 'search validation' do
    it 'should return all matched movies' do
      movie = FactoryGirl.create(:movie, name: 'Bajrangi bhaijaan')
      expect(Movie.search('bhai')).to eq([movie])
    end  
  
    it 'should return [] for non existing movie' do
      expect(Movie.search('hello')).to eq([])
    end  
  end
end
