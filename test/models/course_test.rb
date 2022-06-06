# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  number      :string           not null
#  description :string           default("TBD")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
