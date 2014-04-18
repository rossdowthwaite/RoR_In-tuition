class Course < ActiveRecord::Base

	#---------- ASSOCIATIONS ----------------- 

	belongs_to :user

	has_many :locations, as: :addressable
  	has_many :notifications, as: :notifiable
  	has_one :forum, as: :forumable
  	has_one :profile, as: :profilable
  	
  	has_many :course_items
  	has_many :products, :through => :course_items

	# Join table to add courses to schools
	has_many :school_courses
  	has_many :schools, :through => :school_courses

	# Join table to add courses to posts
	has_many :enrolments
  	has_many :students, :through => :enrolments, before_remove: [:send_unenrolled_notification, :remove_from_forum] 

  	# Join table to add courses to posts
	has_many :course_bookings
  	has_many :bookings, :through => :course_bookings

   	# Join table to add courses to posts
	has_many :course_contents
  	has_many :subjects, :through => :course_contents

	# logo file attament data
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :enrol => "150x150>", :post => "50x50>", :home => "200x200>", :mini => "50x50>"}
  	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  	
	#---------- VALIDATIONS ----------------- 

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
	  	@enrolments = self.enrolments.pluck(:student_id)
	    @students = Student.with_ids(@enrolments).pupils(user)
	  	user.courses.include?(self) || @students.count == 1
	  end

	  # This method checks permissions for the :update and :edit action
	  def is_updatable_by(user, parent = nil)
	  	user.courses.include?(parent)
	  end

	  # This method checks permissions for the :destroy action
	  def is_deletable_by(user, parent = nil)
	  	user.courses.include?(parent)
	  end


  	#---------- CALLBACKS ----------------- 

  	after_create :build_forum 
  	before_destroy :destroy_forum
  	after_create :build_profile


	def build_forum
		@forum = Forum.create(:title => self.title + ' Forum', :description => 'Course Message Board', :forumable_id => self.id, :forumable_type => 'Course')
		ForumContributor.create(:forum_id => @forum.id, :user_id => self.user.id)
		@forum.posts << Post.create(:user_id => self.user.id, :content => '<h4>Welcome to your course dashboard.</h4> 

			Use this space to interact with and manage your students, update course content to give your students instant access to your materials, and manage your course profile to advertise it to the world!

			This is your course message board. Any posts you make here will go out to students enrolled on this course. They can also make posts and comment on this board.
			
			Feel free to delete this post before you start adding students')
	end

	def destroy_forum
		@forum = Forum.where(:course_id => self.id).first
		@forum.destroy
	end

	def build_profile
		Profile.create(:profilable_type => 'Course', :profilable_id => self.id)
	end

	def send_unenrolled_notification(student)
	    @notifiable = self
	    @student = student
	    @sender = User.find(@notifiable.user_id)
	    @reciever = User.find(@student.pupil_id)
	    @notifiable.notifications.create(:user => @sender, :receiver_id => @reciever.id, :message => 'You have been un-enrolled from the course - ' + @notifiable.title)
	end

	def remove_from_forum(student)
	    @forum = Forum.where(:forumable_id => self.id, :forumable_type => 'Course').first
	    @contributor =  ForumContributor.where(:forum_id => @forum.id, :user_id => student.pupil.id)
	    @contributor.each do |c|
	      c.destroy
	    end
  	end

end
