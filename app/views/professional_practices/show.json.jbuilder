json.extract! @professional_practice, :id, :area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime, :created_at, :updated_at
json.majors @professional_practice.majors.each do |major|
  json.name major.name
end
