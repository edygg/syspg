json.array!(@professional_practices) do |professional_practice|
  json.extract! professional_practice, :id, :area, :charge, :objective, :daily_tasks, :observation, :hire_probability, :flexitime, :boss_name, :boss_email, :check_in, :check_out
  json.company professional_practice.company.name
  json.majors professional_practice.majors.each do |major|
    json.id major.id
    json.name major.name
  end
end
