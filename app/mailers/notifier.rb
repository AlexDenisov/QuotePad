class Notifier < ActionMailer::Base
  include Resque::Mailer

  default from: "from@example.com"

  def new_user(email, password)
    @email = email
    @password = password
    @url  = APP_CONFIG['url']
    @service = APP_CONFIG['service_name']
    subject = "#{t(:welcome_to)} #{APP_CONFIG['service_name']}"
    mail(:to => email, :subject => subject)
  end

  def new_excerpt(user_id, excerpt_id)
    @user = User.find user_id
    @excerpt = Excerpt.find excerpt_id
    @author = @excerpt.author
    @url  = APP_CONFIG['url']
    @service = APP_CONFIG['service_name']
    subject = "#{t(:new_excerpt_on)} #{APP_CONFIG['service_name']}"
    mail(:to => @user.email, :subject => subject)
  end

end
