json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :name, :dead_line
  json.url assignment_url(assignment, format: :json)
end
