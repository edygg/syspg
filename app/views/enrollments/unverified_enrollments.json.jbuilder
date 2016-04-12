json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id
  json.student do
    json.name enrollment.student.name
    json.unitec_id enrollment.student.unitec_id
  end

  unless enrollment.graduation_project.nil?
    json.graduation_project do
      json.name enrollment.graduation_project.name
      json.company enrollment.graduation_project.company.name
    end
  end

  unless enrollment.professional_practice.nil?
    json.professional_practice do
      json.charge enrollment.professional_practice.charge
      json.company enrollment.professional_practice.company.name
    end
  end
end
