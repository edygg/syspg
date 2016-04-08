json.array!(@professional_practices) do |professional_practice|
  json.extract! professional_practice, :id, :area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime, :boss_name, :boss_email, :check_in, :check_out
  json.majors professional_practice.majors.each do |major|
    json.name major.name
  end
  json.url professional_practice_url(professional_practice, format: :json)
end
