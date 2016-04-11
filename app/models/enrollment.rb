class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :graduation_project
  belongs_to :professional_practice
end
