class Classroom < ActiveRecord::Base
  belongs_to :academy
  belongs_to :subject
  belongs_to :quarter
  has_and_belongs_to_many :students
end
