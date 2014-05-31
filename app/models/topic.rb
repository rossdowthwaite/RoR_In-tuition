class Topic < ActiveRecord::Base
	belongs_to :user

	# Join for subjects and topics
	has_many :subject_topics
  	has_many :subjects, :through => :subject_topics

  	# A topics materials
	has_many :materials 
	has_many :text_mediums, :through => :materials, :source => :medium, :source_type => "Text"
	has_many :video_mediums, :through => :materials, :source => :medium, :source_type => "Video"
	has_many :upload_mediums, :through => :materials, :source => :medium, :source_type => "Upload"

  #---------- VALIDATIONS -----------------

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :decription, length: { maximum: 500 }

	#---------- AUTHENTICATION ----------------- 

 # this functionality was implemented using the RESTful_ACL gem 
 # and by following this tutorial - http://everydayrails.com/2010/06/16/authorization-restful-acl-1.html 
 # full referencses can be found in the full report reference page - [51][45]

	  def self.is_indexable_by(user, parent = nil)
	  	user != nil
	  end

	  def self.is_creatable_by(user, parent = nil)
	  	user != nil
	  end

	  def is_readable_by(user, parent = nil)
	  	@subjects = self.subjects
	  	catch (:done) do
		  	@subjects.each do |sub|
			  	@courses = sub.courses
				@courses.each do |course|
					@enrolments = course.enrolments.pluck(:student_id)
					@students = Student.with_ids(@enrolments).pupils(user)
					if @students.count > 0
						@poo = true
						throw :done
					end
				end
		  	end
		end
	  	user.topics.include?(self) || @poo
	  end

	  def is_updatable_by(user, parent = nil)
	  	user.topics.include?(self)
	  end

	  def is_deletable_by(user, parent = nil)
	  	user.topics.include?(self)
	  end
end
