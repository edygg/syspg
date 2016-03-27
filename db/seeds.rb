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

company_user = User.where(email: "egonzalez@enterprise.com.hn").first
if company_user.nil?
  company_user = User.new(email: "egonzalez@enterprise.com.hn", password: "computacion1.", role: "company")
  company_user.skip_confirmation!
  company_user.save
  company_profile = Company.create(name: 'Enterprise', phone: '22222222', web_site: 'enterprise.com.hn', contact_name: 'Edilson Fernando Gonzalez', contact_email: 'egonzalez@enterprise.com.hn', contact_phone: '89607624', contact_job_title: 'Consultor SAP', user_id: company_user.id)
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
