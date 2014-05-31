class AdminController < ApplicationController
	before_action :set_user

	def index

	end

	def posts
		@posts = Post.all
	end

	def comments
		@comments = Comment.all
	end

	def courses
		@courses = Course.all
	end

	def users
		@users = User.all
	end

	def uploads
		@uploads = Upload.all
	end

	def forums
		@forums = Forum.all
	end

	private

	# checks if the user is admin
	def set_user
		@user = current_user
		if !current_user.is_admin?
			# redirects to the denied path if not
			redirect_to denied_path
		end
	end
end
