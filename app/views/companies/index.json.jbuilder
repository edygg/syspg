json.array!(@companies) do |company|
  json.extract! company, :id, :name, :phone, :web_site, :contact_name, :contact_email, :contact_phone, :contact_job_title
  json.url company_url(company, format: :json)
end
