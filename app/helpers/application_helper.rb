module ApplicationHelper

	# Method to format the date - code found at http://stackoverflow.com/questions/8153940/how-to-alter-the-datetime-format-for-views-with-i18n
	def date(the_date)
      if !the_date.nil? 
         the_date.strftime('%m/%d/%Y')
      end
   end

   def time(the_time)
      if !the_time.nil? 
         the_time.strftime('%H:%M')
      end
   end


   # this method was implemented using code from the following tutorial http://railscasts.com/episodes/154-polymorphic-association?view=asciicast
   def poly(type, id)
      if type.singularize.classify.constantize.find_by_id(id)
         return type.singularize.classify.constantize.find(id)
      end
   end

   def image?(upload)
      upload.to_s.include?(".gif") or upload.to_s.include?(".png") or upload.to_s.include?(".jpg") or upload.to_s.include?(".jpeg") or upload.to_s.include?(".JPEG")  or upload.to_s.include?(".JPG")  or upload.to_s.include?(".PNG") 
   end

   def owned_by(user, thing)
      if thing.class.name != 'User'
         if thing.user == user
            return true
         end
      else
         if user == thing
            return true
         end
      end
   end
  
end
