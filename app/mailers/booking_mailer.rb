class BookingMailer < ActionMailer::Base

  # send an email to the appointment user when the the appointment saves - 
  # RailsGuide tutorial followed - http://guides.rubyonrails.org/action_mailer_basics.html.

  default from: "in-tuition@example.com"

  def booking_email(user, booking, owner)
  	@user = user
  	@booking = booking
  	@owner = owner
  	mail(to: @user.email, subject: 'New Booking!')
  end
end
