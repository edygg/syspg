class Campu < ActiveRecord::Base
  has_many :students
  has_many :academies
  has_many :classrooms 
end
