class User < ActiveRecord::Base

	# callback to use the authologic functionality
	acts_as_authentic

	# Avatar file attament data
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :student => "210x210>", :home => "200x200>", :mini => "50x50>"}
  	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  	# Students
  	has_many :students, dependent: :destroy
	has_many :pupils, :through => :students, :source => :pupil, :source_type => "User"

	# Appointments
	has_many :appointments, dependent: :destroy
	has_many :bookings, :through => :appointments

	has_many :booked_bookings, :source => :booker, :source_type => "Booking"

	# Forums
	has_many :forum_contributors, dependent: :destroy
	has_many :forums, as: :contributor, :through => :forum_contributors

	# Notifications
	has_many :notifications, dependent: :destroy
	has_many :incoming,  :class_name => "Notification", :foreign_key => "reciever"

	# courses
	has_many :courses, dependent: :destroy
	has_many :schools, dependent: :destroy

	# Content
	has_many :subjects, dependent: :destroy
	has_many :topics, dependent: :destroy
	has_many :videos, dependent: :destroy
	has_many :texts, dependent: :destroy
	has_many :uploads, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :qualifications, dependent: :destroy
	has_many :goals, dependent: :destroy
	has_many :products, dependent: :destroy

	# Polymorphic associations
	has_many :locations, as: :addressable, dependent: :destroy
	has_one :profile, as: :profilable, dependent: :destroy

	#---------- Validations -----------------

	scope :admins, -> { where(:is_admin => true) }


	#---------- Validations -----------------  

  	validates_date :dob, :before => lambda { 16.years.ago },
                         :before_message => ' - Must be at least 16 to sign up'


  	#---------- AUTHENTICATION ----------------- 

 # this functionality was implemented using the RESTful_ACL gem 
 # and by following this tutorial - http://everydayrails.com/2010/06/16/authorization-restful-acl-1.html 
 # full referencses can be found in the full report reference page - [51][45]

	  def self.is_indexable_by(user, parent = nil)
	  	user != nil
	  end

	  def self.is_creatable_by(user, parent = nil)
	  	user == nil || user != nil
	  end

	  def is_readable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	  def is_updatable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	  def is_deletable_by(user, parent = nil)
	  	user == self || user.is_admin?
	  end

	after_create :build_profile
	before_destroy :check_if_last_admin
	
	def build_profile
		Profile.create(:profilable_type => 'User', :profilable_id => self.id)
	end

	def check_if_last_admin
		@admin_users = User.admins
		raise "Can't delete last admin" if self.is_admin == true && @admin_users.count == 1
	end

	# users name
	def users_name
	    self.title
	end



end
