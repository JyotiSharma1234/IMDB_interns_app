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

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
