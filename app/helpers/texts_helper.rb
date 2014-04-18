module TextsHelper

   def simple_format_no_tags(text, html_options = {}, options = {})
     text = '' if text.nil?
     text = smart_truncate(text, options[:truncate]) if options[:truncate].present?
     text = sanitize(text) unless options[:sanitize] == false
     text = text.to_str
     text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
     text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
     text.html_safe
   end
	
end
