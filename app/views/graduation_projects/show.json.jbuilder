json.extract! @graduation_project, :id, :name, :description, :objective, :requirements, :created_at, :updated_at
json.company @graduation_project.company.name
json.majors @graduation_project.majors.each do |major|
  json.name major.name
end
