json.array!(@students) do |student|
  json.extract! student, :id, :name, :unitec_id, :phone
  json.type 'Proyecto de Graduación' unless student.enrollment.graduation_project.nil?
  json.type 'Práctica Profesional' unless student.enrollment.professional_practice.nil?
  json.url student_url(student, format: :json)
end
