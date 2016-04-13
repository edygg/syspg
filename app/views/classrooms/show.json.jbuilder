json.extract! @classroom, :id, :section, :created_at, :updated_at
json.academic_name @classroom.academy.name
json.subject_name @classroom.subject.name
json.quarter do
  json.period @classroom.quarter.period
  json.year @classroom.quarter.year
end
