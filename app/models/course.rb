class Course < ApplicationRecord
  has_many :sections

  # A course has many evaluations through sections
  # A course has many bid_histories through sections
end
