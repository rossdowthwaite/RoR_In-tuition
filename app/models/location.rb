class Location < ActiveRecord::Base
	belongs_to :addressable, :polymorphic => true

	belongs_to :course, :foreign_key => :addressable_id, :foreign_type => 'Course'

	geocoded_by :location_to_string

	#---------- Validations -----------------  

	validates :p_code, presence: true


    after_validation :geocode

    def location_to_string
	  	@string = ""
	  	@string = @string + self.city if self.city?
	  	@string = @string + self.county if self.county?
	  	@string = @string + self.country if self.country?
  	return @string
  end
end
