class Actor < ApplicationRecord
  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :description, presence: true, length: { in: 5..30}
end
