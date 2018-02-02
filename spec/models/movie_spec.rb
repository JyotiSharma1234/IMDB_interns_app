require 'rails_helper'
require 'database_cleaner'
RSpec.describe Movie do
  context 'Movie' do
    it 'should valid movie' do
      movie = FactoryGirl.create(:movie)
      expect(movie.valid?).to eq(true)
    end
  end

  context 'name' do
    it 'has invalid name' do
      movie = FactoryGirl.build(:movie, :name => '')
      movie.valid?
      expect(movie.errors['name']).to eq([" : Field cannot be empty"])
    end
  end

  context 'release_date' do
    it 'has invalid release date' do
        movie = FactoryGirl.build(:movie, :release_date => '')
      movie.valid?
      expect(movie.errors['release_date']).to eq([" : Field cannot be empty"])
    end
  end

  context 'description' do
    it 'has invalid description' do
      movie = FactoryGirl.build(:movie, :description => 'm')
      movie.valid?
      expect(movie.errors['description']).to eq(["is too short (minimum is 6 characters)"])
    end
  end

  context 'rating' do
    it 'has invalid rating' do
      movie = FactoryGirl.build(:movie, :rating => 6)
      movie.valid?
      expect(movie.errors['rating']).to eq([" : Rating must be between 0 to 5"])
      expect(movie.valid?).to eq(false)
    end

    it 'has negative rating' do
      movie = FactoryGirl.build(:movie, :rating => -2)
      movie.valid?
      expect(movie.errors['rating']).to eq([" : Rating must be between 0 to 5"])
      expect(movie.valid?).to eq(false)
    end

    it 'has invalid rating in decimal' do
      movie = FactoryGirl.build(:movie, :rating => 6.5)
      movie.valid?
      expect(movie.errors['rating']).to eq([" : Rating must be between 0 to 5"])
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

  context 'search' do
    before(:each) do
      @movie1 = FactoryGirl.create(:movie, name: 'Bajrangi bhaijaan')
      @movie2 = FactoryGirl.create(:movie, name: 'Hello bhaijaan')
      @movie3 = FactoryGirl.create(:movie, name: 'Bajrangi')
    end

    after(:each) do
      DatabaseCleaner.clean
    end
    
    it 'should return all matched movies' do
      expect(Movie.search('bhai')).to eq([@movie1,@movie2])
    end

    it 'should return [] for non existing movie' do
      expect(Movie.search('hero')).to eq([])
    end

    it 'should return all movie if search parameter is empty' do
      expect(Movie.search('')).to eq([@movie1,@movie2,@movie3])
    end
  end
end
