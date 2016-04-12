json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :section
  json.url classroom_url(classroom, format: :json)
end
