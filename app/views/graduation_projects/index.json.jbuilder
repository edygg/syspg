json.array!(@graduation_projects) do |graduation_project|
  json.extract! graduation_project, :id, :name, :description, :objective, :requirements
  json.company graduation_project.company.name
  json.majors graduation_project.majors.each do |major|
    json.name major.name
  end
  json.url graduation_project_url(graduation_project, format: :json)
end
