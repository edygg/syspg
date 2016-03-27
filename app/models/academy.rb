class Academy < ActiveRecord::Base
  belongs_to :user
  belongs_to :major
  belongs_to :campu
end
