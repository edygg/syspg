class Company < ActiveRecord::Base
  belongs_to :user
  has_many :professional_practices
  has_many :graduation_projects
  belongs_to :company_category
end
