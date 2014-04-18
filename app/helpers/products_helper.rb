module ProductsHelper

	def public?(product)
		product.show_in_profile?	
	end

end
