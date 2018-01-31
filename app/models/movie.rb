# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :string
#  rating       :integer
#  release_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ApplicationRecord
  validates :name, :release_date, :description, :rating, presence: { message: 'Field cannot be empty'}
  validates :description, length: { in: 6...40 }
  validates_inclusion_of :rating, :in => 0..5
end
