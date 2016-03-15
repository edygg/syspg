class Company < ActiveRecord::Base
  belongs_to :user
  has_many :professional_practices
end
