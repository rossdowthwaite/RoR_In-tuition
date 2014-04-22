module UploadsHelper
	def set_image_styling
		@icon = '<i class="fa fa-camera-retro fa-2x tab_icons"></i>'
		@new_class = 'image_tab'
	end

	def set_upload_styling
		@icon = '<i class="fa fa-clipboard fa-2x tab_icons"></i>'
		@new_class = 'upload_tab'
	end
end
