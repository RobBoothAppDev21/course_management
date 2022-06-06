# == Schema Information
#
# Table name: instructors
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  title         :string
#  department    :string           default("Faculty")
#  phone_number  :string
#  email         :string
#  academic_area :string           default("TBD")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class InstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
