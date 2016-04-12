json.extract! @student, :id, :name, :unitec_id, :phone, :available, :created_at, :updated_at
json.major do
  json.id  @student.major.id
  json.name @student.major.name
end
