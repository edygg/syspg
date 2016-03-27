json.companies @unverified_companies do |company|
  json.user_id company.user.id
  json.user_email company.user.email
  json.name company.name
end

json.students @unverified_students do |student|
  json.user_id student.user.id
  json.user_email student.user.email
  json.name student.name
  json.unitec_id student.unitec_id
end

json.academics @unverified_academics do |academic|
  json.user_id academic.user.id
  json.user_email academic.user.email
  json.name academic.name
end
