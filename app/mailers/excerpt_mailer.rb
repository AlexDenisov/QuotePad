class ExcerptMailer < ActionMailer::Base
  default from: APP_CONFIG['mailer_from']

  def new_excerpt(user, excerpt)
    @excerpt = excerpt
    @author = @excerpt.user
    @url  = APP_CONFIG['url']
    @service = APP_CONFIG['service_name']
    mail(:to => user.email, :subject => "New Excerpt added")
  end
 
end
