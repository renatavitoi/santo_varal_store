# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# sendgrid email server config added to ActionMailer method for usage on Heroku
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: Rails.application.credentials.SENDGRID_USERNAME,
  password: Rails.application.credentials.SENDGRID_PASSWORD,
  domain: 'heroku.com',
  enable_starttls_auto: true
}
