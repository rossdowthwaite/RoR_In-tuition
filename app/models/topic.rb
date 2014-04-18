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
