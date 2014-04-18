class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user
	helper_method :notifications

	private

	def notifications
		notifications = Notification.my_notifications(current_user.id).new_notifications
	end

	# The follwing method were created by following a tutorial found at - http://railscasts.com/episodes/160-authlogic
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
