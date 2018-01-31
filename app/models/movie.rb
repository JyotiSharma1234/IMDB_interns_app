class Movie < ApplicationRecord
  validates :name, :release_date, :description, :rating, presence: { message: 'Field cannot be empty'}
  validates :description, length: { in: 6...40 }
  validates :rating, length: {in: 0...5 }
end
