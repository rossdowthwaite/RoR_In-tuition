module UsersHelper

def first_time_user?
	current_user.login_count == 1 && current_user.courses.count == 0 && current_user.bookings.count == 0
end


end
