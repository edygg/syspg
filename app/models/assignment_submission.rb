class AssignmentSubmission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  has_attached_file :assignment_file
  has_attached_file :counseling_file
  do_not_validate_attachment_file_type :assignment_file
  do_not_validate_attachment_file_type :counseling_file
  
end
