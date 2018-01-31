class Actor < ApplicationRecord
  #has_and_belongs_to_many :movies
  has_and_belongs_to_many :casts, :join_table => "casts", :class_name => "Movie"
end
