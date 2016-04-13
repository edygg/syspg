class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :campu
  belongs_to :major
  has_one :enrollment
  has_and_belongs_to_many :classrooms
  has_many :assignment_submissions
end
