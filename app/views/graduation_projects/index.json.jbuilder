json.array!(@graduation_projects) do |graduation_project|
  json.extract! graduation_project, :id, :name, :description, :objective, :requirements
  json.url graduation_project_url(graduation_project, format: :json)
end
