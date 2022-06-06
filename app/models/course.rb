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
class Course < ApplicationRecord
  has_many :sections

  # A course has many evaluations through sections
  # A course has many bid_histories through sections
end
