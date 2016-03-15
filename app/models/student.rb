class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :campu
  belongs_to :major
end
