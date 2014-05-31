class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user
	helper_method :notifications

	private

	# get all the user notifications
	def notifications
		notifications = Notification.my_notifications(current_user.id).new_notifications
	end

	# The following two methods were implemented using code from following a tutorial found at - http://railscasts.com/episodes/160-authlogic
	# full reference found in report references [50]
	
	# Set the current user
	
	def current_user_session
	  return @current_user_session if defined?(@current_user_session)
	  @current_user_session = UserSession.find
	end

	def current_user
	  return @current_user if defined?(@current_user)
	  @current_user = current_user_session && current_user_session.record
	end

end
