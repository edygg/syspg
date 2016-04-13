json.array!(@assignment_submissions) do |assignment_submission|
  json.extract! assignment_submission, :id
  json.student_name assignment_submission.student.name
  json.student_unitec_id assignment_submission.student.unitec_id
  json.assignment_file_url assignment_submission.assignment_file.url(:original, false)
  json.can_upload_counseling !assignment_submission.counseling_file.exists?
end
