# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

academic_chef_user = User.where(email: "academic_chef@unitec.edu").first
if academic_chef_user.nil?
  academic_chef_user = User.new(email: "academic_chef@unitec.edu", password: "computacion1.", role: "academy_chef")
  academic_chef_user.skip_confirmation!
  academic_chef_user.save
  academic_chef_profile = Academy.create(name: "Juan Jefe", phone: "22467879", campu: Campu.first, major: Major.first)
end

academic_user = User.where(email: "academic@unitec.edu").first
if academic_user.nil?
  academic_user = User.new(email: "academic@unitec.edu", password: "computacion1.", role: "academy")
  academic_user.skip_confirmation!
  academic_user.save
  academic_profile = Academy.create(name: "Laurenn Cruz", phone: "55556969", campu: Campu.first, major: Major.first)
end