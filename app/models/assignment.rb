class Assignment < ActiveRecord::Base
  belongs_to :classroom
  has_many :assignment_submissions
end
