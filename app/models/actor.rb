# == Schema Information
#
# Table name: actors
#
#  id            :integer          not null, primary key
#  name          :string
#  date_of_birth :date
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Actor < ApplicationRecord
  #has_and_belongs_to_many :movies
  has_and_belongs_to_many :casts, :join_table => "casts", :class_name => "Movie"
  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: 'Invalid' }
  validates :date_of_birth, presence: true
  validates :description, presence: true, length: { in: 5..100 }
  validate :validate_date_of_birth

  def validate_date_of_birth
    errors.add("data_of_birth", "(Dates from future not allowed!)") unless date_of_birth < Time.now
  end
end
