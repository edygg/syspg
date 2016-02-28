# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	user_name: 'no.reply.syspg@gmail.com',
	password: 'computacion1.',
	domain: 'gmail.com',
	address: 'smtp.gmail.com',
	port: 587,
	authentication: :login,
	enable_starttls_auto: true
}