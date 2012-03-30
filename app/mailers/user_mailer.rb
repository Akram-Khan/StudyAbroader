class UserMailer < ActionMailer::Base
  default :from => "admin@studyabroader.com"
  default_url_options[:host] = "studyabroader.com"

  def sendmail(username, email, title, body)
  	@username = username
  	@message = body
    mail(:to => email, :subject => title)
  end

end
