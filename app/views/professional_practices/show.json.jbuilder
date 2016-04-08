json.extract! @professional_practice, :id, :area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime, :boss_name, :boss_email, :check_in, :check_out, :created_at, :updated_at
json.majors @professional_practice.majors.each do |major|
  json.name major.name
end
