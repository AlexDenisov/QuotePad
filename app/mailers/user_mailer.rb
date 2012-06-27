class UserMailer < ActionMailer::Base
  default from: APP_CONFIG['mailer_from']
  def welcome(user, password)
    @user = user
    @password = password
    @url  = APP_CONFIG['url']
    @service = APP_CONFIG['service_name']
    mail(:to => user.email, :subject => "Welcome to #{APP_CONFIG['service_name']}")
  end
end
