json.email @user.email#xxx
if @user.role == 'company'
  json.name @user.company.name#x
  json.phone @user.company.phone#x
  json.web_site @user.company.web_site#x
  json.company_category @user.company.company_category.name
  json.contact do
    json.name @user.company.contact_name#x
    json.email @user.company.contact_email#x
    json.phone @user.company.contact_phone#x
    json.job_title @user.company.contact_job_title#x
  end
elsif @user.role == 'student'
  json.name @user.student.name#x
  json.unitec_id @user.student.unitec_id#x
  json.phone @user.student.phone#x
  json.campus @user.student.campu.name#x
  json.major @user.student.major.name#x
else
  json.academic_type @user.role
  json.name @user.academy.name#x
  json.phone @user.academy.phone#x
  json.campus @user.academy.campu.name#x
  json.major @user.academy.major.name#x
end
