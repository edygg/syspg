ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port  => 587,
  :domain  => 'gmail.com',
  :user_name => "no.reply.syspg@gmail.com",
  :password => "computacion1.",
  :authentication => :login,
  :enable_starttls_auto => true
}