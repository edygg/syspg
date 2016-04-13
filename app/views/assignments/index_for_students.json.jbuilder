json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :name, :dead_line
  json.can_send_submissions (DateTime.now < DateTime.parse(assignment.dead_line) && assignment.assignment_submissions.joins(:student).where(students: { id: @student.id }).first.nil?)
  unless (assignment.assignment_submissions.joins(:student).where(students: { id: @student.id }).first.nil?)
    json.counseling_file_url assignment.assignment_submissions.joins(:student).where(students: { id: @student.id }).first.counseling_file.url(:original, false)
  end
  json.url assignment_url(assignment, format: :json)
end