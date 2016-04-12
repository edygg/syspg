# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Campu.create([{ name: 'Tegucigalpa' }, { name: 'San Pedro Sula' }, { name: 'La Ceiba' }]) if Campu.count == 0
if Faculty.count < 2
  faculty1 = Faculty.create({ name: 'Facultad de Ingeniería y Arquitectura' })
  faculty2 = Faculty.create({ name: 'Facultad de Ciencias Administrativas' })
else
  faculty1 = Faculty.first
  faculty2 = Faculty.last
end

Major.create([
  { name: 'Ingeniería en Sistemas Computacionales', faculty: faculty1 },
  { name: 'Ingeniería Civil', faculty: faculty1 },
  { name: 'Ingeniría Indrustrial y Sistemas', faculty: faculty1 }
  ]) if Major.where(faculty_id: faculty1.id).count == 0

Major.create([
  { name: 'Licenciatura en Turismo', faculty: faculty2 },
  { name: 'Licenciatura en Finanzas', faculty: faculty2 },
  { name: 'Licenciatura en Administración Industrial y de Negocios', faculty: faculty2 }
  ]) if Major.where(faculty_id: faculty2.id).count == 0

CompanyCategory.destroy_all
CompanyCategory.create([
  { name: 'Abogados' },
  { name: 'Accesorios de automotes' },
  { name: 'Accesorios para computación' },
  { name: 'Accesorios y equipos para medicina' },
  { name: 'Accesorios y materiales eléctricos' },
  { name: 'Accesorios y repuestos para electrodomésticos' },
  { name: 'Fabricación de aceite vegetal' },
  { name: 'Instalaciones y montajes de maquinarias' },
  { name: 'Tratamientos térmicos' },
  { name: 'Acopio de cereales' },
  { name: 'Aditivos' },
  { name: 'Administración de empresas' },
  { name: 'Administración de propiedades' },
  { name: 'Afinación de automotes' },
  { name: 'Agencias de automotores' },
  { name: 'Agencia de publicidad' },
  { name: 'Agencias marítimas' },
  { name: 'Agricultura' },
  { name: 'Agrimensores' },
  { name: 'Agroquímicos' },
  { name: 'Aguas gaseosas y minerales' },
  { name: 'Aire acondicionado' },
  { name: 'Aislaciones acústicas' },
  { name: 'Aislaciones térmicas' },
  { name: 'Alarmas' },
  { name: 'Albañilería' },
  { name: 'Almacén mayorista' },
  { name: 'Máquinas y herramientas' },
  { name: 'Alquiler de oficinas' },
  { name: 'Amoblamientos' },
  { name: 'Ortopedia' },
  { name: 'Arquitectos' },
  { name: 'Artículos de electrónica' },
  { name: 'Artículos de limpieza' },
  { name: 'Artículos ara farmacia' },
  { name: 'Asesoria de software' },
  { name: 'Audio profesional' },
  { name: 'Desarrollo de software' }
])

company_user = User.where(email: "egonzalez@enterprise.com.hn").first
if company_user.nil?
  company_user = User.new(email: "egonzalez@enterprise.com.hn", password: "computacion1.", role: "company")
  company_user.skip_confirmation!
  company_user.save
  company_profile = Company.create(name: 'Enterprise', phone: '22222222', web_site: 'enterprise.com.hn', contact_name: 'Edilson Fernando Gonzalez', contact_email: 'egonzalez@enterprise.com.hn', contact_phone: '89607624', contact_job_title: 'Consultor SAP', user_id: company_user.id, company_category: CompanyCategory.last)
end

academic_chef_user = User.where(email: "academic_chef1@unitec.edu").first
if academic_chef_user.nil?
  academic_chef_user = User.new(email: "academic_chef1@unitec.edu", password: "computacion1.", role: "academy_chef", verified: true)
  academic_chef_user.skip_confirmation!
  academic_chef_user.save
  academic_chef_profile = Academy.create(name: "Laurenn Alecxandra Cruz", phone: "22467879", campu: Campu.first, major: Major.first, user: academic_chef_user)
end

academic_user = User.where(email: "academic@unitec.edu").first
if academic_user.nil?
  academic_user = User.new(email: "academic@unitec.edu", password: "computacion1.", role: "academy")
  academic_user.skip_confirmation!
  academic_user.save
  academic_profile = Academy.create(name: "Oscar Cruz", phone: "55556969", campu: Campu.first, major: Major.first, user: academic_user)
end

student1 = User.where(email: "amy@unitec.edu").first
if student1.nil?
  student1 = User.new(email: "amy@unitec.edu", password: "computacion1.", role: "student")
  student1.skip_confirmation!
  student1.save
  student1_profile = Student.create(name: "Amy Gonzalez", unitec_id: "11211010", phone: "89897878", user: student1, campu: Campu.first, major: Major.first)
end

student2 = User.where(email: "angie@unitec.edu").first
if student2.nil?
  student2 = User.new(email: "angie@unitec.edu", password: "computacion1.", role: "student")
  student2.skip_confirmation!
  student2.save
  student2_profile = Student.create(name: "Angie Gonzalez", unitec_id: "11211011", phone: "89897878", user: student2, campu: Campu.first, major: Major.first)
end

student3 = User.where(email: "brenda@unitec.edu").first
if student3.nil?
  student3 = User.new(email: "brenda@unitec.edu", password: "computacion1.", role: "student")
  student3.skip_confirmation!
  student3.save
  student3_profile = Student.create(name: "Brenda Gonzalez", unitec_id: "11211012", phone: "89897878", user: student3, campu: Campu.first, major: Major.first)
end

student4 = User.where(email: "suany@unitec.edu").first
if student4.nil?
  student4 = User.new(email: "suany@unitec.edu", password: "computacion1.", role: "student")
  student4.skip_confirmation!
  student4.save
  student4_profile = Student.create(name: "Suany Gonzalez", unitec_id: "11211013", phone: "89897878", user: student4, campu: Campu.first, major: Major.first)
end

if Subject.count < 6
  Subject.destroy_all

  Subject.create(name: 'Proyecto Graduación Fase 1')
  Subject.create(name: 'Proyecto Graduación Fase 2')
  Subject.create(name: 'Práctica Profesional Fase 1')
  Subject.create(name: 'Práctica Profesional Fase 2')
  Subject.create(name: 'Proyecto Graduación')
  Subject.create(name: 'Práctica Profesional')
end

# Practicas profesionales
ProfessionalPractice.destroy_all

pp1 = ProfessionalPractice.new(area: 'Area 1', charge: 'Cargo 1', objective: 'Objectivo 1', daily_tasks: 'Responsabilidades 1', boss_name: 'Jefe 1', boss_email: 'jefe1@jefe.com', check_in: '', check_out: '', hire_probability: false, flexitime: false, company: Company.first)
pp1.majors << Major.first
pp1.save

pp2 = ProfessionalPractice.new(area: 'Area 2', charge: 'Cargo 2', objective: 'Objectivo 2', daily_tasks: 'Responsabilidades 2', boss_name: 'Jefe 2', boss_email: 'jefe2@jefe.com', check_in: '', check_out: '', hire_probability: false, flexitime: false, company: Company.first)
pp2.majors << Major.first
pp2.save

pp3 = ProfessionalPractice.new(area: 'Area 3', charge: 'Cargo 3', objective: 'Objectivo 3', daily_tasks: 'Responsabilidades 3', boss_name: 'Jefe 3', boss_email: 'jefe3@jefe.com', check_in: '', check_out: '', hire_probability: false, flexitime: false, company: Company.first)
pp3.majors << Major.first
pp3.save

pp4 = ProfessionalPractice.new(area: 'Area 4', charge: 'Cargo 4', objective: 'Objectivo 4', daily_tasks: 'Responsabilidades 4', boss_name: 'Jefe 4', boss_email: 'jefe4@jefe.com', check_in: '', check_out: '', hire_probability: false, flexitime: false, company: Company.first)
pp4.majors << Major.last
pp4.save

pp5 = ProfessionalPractice.new(area: 'Area 5', charge: 'Cargo 5', objective: 'Objectivo 5', daily_tasks: 'Responsabilidades 5', boss_name: 'Jefe 5', boss_email: 'jefe5@jefe.com', check_in: '', check_out: '', hire_probability: false, flexitime: false, company: Company.first)
pp5.majors << Major.last
pp5.save

# Proyectos de Graduación
GraduationProject.destroy_all

gp1 = GraduationProject.new(name: 'Nombre 1', description: 'Descripción 1', objective: 'Objetivo 1', requirements: 'Requisitos 1', company: Company.first)
gp1.majors << Major.first
gp1.save

gp2 = GraduationProject.new(name: 'Nombre 2', description: 'Descripción 2', objective: 'Objetivo 2', requirements: 'Requisitos 2', company: Company.first)
gp2.majors << Major.first
gp2.save

gp3 = GraduationProject.new(name: 'Nombre 3', description: 'Descripción 3', objective: 'Objetivo 3', requirements: 'Requisitos 3', company: Company.first)
gp3.majors << Major.first
gp3.save

gp4 = GraduationProject.new(name: 'Nombre 4', description: 'Descripción 4', objective: 'Objetivo 4', requirements: 'Requisitos 4', company: Company.first)
gp4.majors << Major.last
gp4.save

gp5 = GraduationProject.new(name: 'Nombre 5', description: 'Descripción 5', objective: 'Objetivo 5', requirements: 'Requisitos 5', company: Company.first)
gp5.majors << Major.last
gp5.save

Quarter.destroy_all

Quarter.create([
    { period: 1, year: 2016 },
    { period: 2, year: 2016 },
    { period: 4, year: 2016 },
    { period: 5, year: 2016 },
])
