class Major < ActiveRecord::Base
  belongs_to :faculty
  has_and_belongs_to_many :professional_practices
  has_and_belongs_to_many :graduation_projects
end
