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

  has_and_belongs_to_many :actors
  #has_and_belongs_to_many :casts, :join_table => "casts", :class_name => "Actor"
  validates :name, :release_date, :description, :rating, presence: { message: ' : Field cannot be empty'}
  validates :description, length: { in: 6...500 }
  validates_inclusion_of :rating, {:in => 0..5, message: ' : Rating must be between 0 to 5'}

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
