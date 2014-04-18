class Subject < ActiveRecord::Base
  belongs_to :user

  has_many :subject_topics, :dependent => :destroy
  has_many :topics, :through => :subject_topics

    # Join table to add courses to posts
	has_many :course_contents, :dependent => :destroy
  	has_many :courses, :through => :course_contents

  validates :title, presence: true

  	#---------- AUTHENTICATION ----------------- 

	 # This method checks permissions for the :index action
	  def self.is_indexable_by(user, parent = nil)
	  	user != nil
	  end

	  # This method checks permissions for the :create and :new action
	  def self.is_creatable_by(user, parent = nil)
	  	user != nil
	  end

	  # This method checks permissions for the :show action
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

	  # This method checks permissions for the :update and :edit action
	  def is_updatable_by(user, parent = nil)
	  	user.subjects.include?(self)
	  end

	  # This method checks permissions for the :destroy action
	  def is_deletable_by(user, parent = nil)
	  	user.subjects.include?(self)
	  end

end
