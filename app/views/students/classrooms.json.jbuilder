json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :section
  json.academic_name classroom.academy.name
  json.subject_name classroom.subject.name
  json.quarter do
    json.period classroom.quarter.period
    json.year classroom.quarter.year
  end
end