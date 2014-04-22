class User < ActiveRecord::Base

	# callback to use the authologic functionality
	acts_as_authentic

	# Avatar file attament data
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :student => "210x210>", :home => "200x200>", :mini => "50x50>"}
  	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  	# Students
  	has_many :students
	has_many :pupils, :through => :students, :source => :pupil, :source_type => "User"

	# Appointments
	has_many :appointments
	has_many :bookings, :through => :appointments

	has_many :booked_bookings, :source => :booker, :source_type => "Booking"

	# Forums
	has_many :forum_contributors
	has_many :forums, as: :contributor, :through => :forum_contributors

	# Notifications
	has_many :notifications
	has_many :incoming,  :class_name => "Notification", :foreign_key => "reciever"

	# courses
	has_many :courses
	has_many :schools

	# Content
	has_many :subjects
	has_many :topics
	has_many :videos
	has_many :texts
	has_many :uploads
	has_many :posts
	has_many :comments
	has_many :qualifications
	has_many :goals
	has_many :products

	# Polymorphic associations
	has_many :locations, as: :addressable
	has_one :profile, as: :profilable

	#---------- Validations -----------------  

  	validates_date :dob, :before => lambda { 16.years.ago },
                         :before_message => ' - Must be at least 16 to sign up'


  	#---------- AUTHENTICATION ----------------- 


	 # This method checks permissions for the :index action
	  def self.is_indexable_by(user, parent = nil)
	  	user != nil
	  end

	  # This method checks permissions for the :create and :new action
	  def self.is_creatable_by(user, parent = nil)
	  	user == nil || user != nil
	  end

	  # This method checks permissions for the :show action
	  def is_readable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	  # This method checks permissions for the :update and :edit action
	  def is_updatable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	  # This method checks permissions for the :destroy action
	  def is_deletable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	after_create :build_profile
	
	def build_profile
		Profile.create(:profilable_type => 'User', :profilable_id => self.id)
	end

	  # student name
	  def users_name
	    self.title
	  end



end
