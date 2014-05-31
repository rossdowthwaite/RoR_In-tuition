class UserMailer < ActionMailer::Base
	
  # send an email to the appointment user when the the appointment saves - 
  # RailsGuide tutorial followed - http://guides.rubyonrails.org/action_mailer_basics.html.

  default from: "in-tuition@example.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
