class Movie < ApplicationRecord
  #has_and_belongs_to_many :actors
  has_and_belongs_to_many :casts, :join_table => "casts", :class_name => "Actor"
end
