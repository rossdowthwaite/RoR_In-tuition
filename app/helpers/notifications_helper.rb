module NotificationsHelper

	def action_required(notification)
		@notifiable = poly(notification.notifiable_type, notification.notifiable_id) if notification.notifiable_type
		@class = @notifiable.class.name

			if @class == 'Student'
				if @notifiable.response == 'Pending'
					return true
				else
					return false
				end
			end
			if @class == 'Appointment'
				if @notifiable.confirmed == nil
					return true
				else
					return false
				end
			end
	end

	def is_a_(notification)
		@class = notification.class.name
			if @class == 'Forum'
				if notification.response == 'Pending'
					return true
				else
					return false
				end
			end
	end

	def set_notification_style(notification)

		  if action_required(notification)
		  	  @class = 'action'
		  	  @link = 'notification'
			  @icon = '<i class="fa fa-cog fa-2x tab_icons"></i>'
		  elsif notification.seen_at == nil
              @class = 'standard'
              @link = 'notification'
			  @icon = '<i class="fa fa-envelope-o fa-2x tab_icons"></i>'
          else
              @class = 'accepted' 
		  	  @link = 'notification'
			  @icon = '<i class="fa fa-eye fa-2x tab_icons"></i>'
          end
        # OPEN AND CLOSE PRINCIPLE - Open to extension closed to modification 
	end

end
