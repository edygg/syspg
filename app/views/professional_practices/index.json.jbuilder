json.array!(@professional_practices) do |professional_practice|
  json.extract! professional_practice, :id, :area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime
  json.url professional_practice_url(professional_practice, format: :json)
end
