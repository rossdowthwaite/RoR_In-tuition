module LocationsHelper

	def addressable_image_index(addressable)
		case addressable.class.name
			when 'User'    #compare to 1
				@image = @addressable.avatar.url(:thumb) if @addressable.avatar.exists?
			when 'Course'
				@image = @addressable.logo.url(:thumb) if @addressable.logo.exists?
			when 'School'
				@image = @addressable.school_logo.url(:thumb) if @addressable.school_logo.exists?
			end
	end	

	def addressable_image(addressable)
		case addressable.class.name
			when 'User'    #compare to 1
				@image = @addressable.avatar.url(:thumb) if @addressable.avatar.exists?
			when 'Course'
				@image = @addressable.logo.url(:thumb) if @addressable.logo.exists?
			when 'School'
				@image = @addressable.school_logo.url(:thumb) if @addressable.school_logo.exists?
			end
	end	

	def set_addressable_type(addressable)
		case addressable.class.name
			when 'Course'
				@type = @addressable.logo.url(:thumb) if @addressable.logo.exists?
			when 'School'
				@image = @addressable.school_logo.url(:thumb) if @addressable.school_logo.exists?
			end
	end

	def addressable_nav(addressable)
		case addressable.class.name
			when 'Course'
				@nav = 'courses/course_nav'
				@course = addressable
			when 'School'
				@nav = 'schools/school_nav'
				@school = addressable
			when 'User'
				@nav = 'users/user_nav'
				@user = addressable
			end
	end
	
end
