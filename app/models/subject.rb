class Subject < ActiveRecord::Base
  belongs_to :user

  has_many :subject_topics, :dependent => :destroy
  has_many :topics, :through => :subject_topics

    # Join table to add courses to posts
	has_many :course_contents, :dependent => :destroy
  	has_many :courses, :through => :course_contents

  	#---------- VALIDATIONS ----------------- 

  	validates :title, presence: true
  	validates :title, length: { maximum: 50 }
  	validates :description, length: { maximum: 500 }

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
	  	@courses = self.courses
		@courses.each do |course|
			@enrolments = course.enrolments.pluck(:student_id)
			@students = Student.with_ids(@enrolments).pupils(user)
			if @students.count > 0
				@poo = true
				break
			end
		end
	  	user.subjects.include?(self) || @poo
	  end

	  def is_updatable_by(user, parent = nil)
	  	user.subjects.include?(self)
	  end

	  def is_deletable_by(user, parent = nil)
	  	user.subjects.include?(self)
	  end

end
