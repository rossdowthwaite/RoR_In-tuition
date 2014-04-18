module ForumsHelper

	def get_course(id)
		@course = Course.find(id)
	end

end
