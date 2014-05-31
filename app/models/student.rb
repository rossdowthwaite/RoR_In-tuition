class Student < ActiveRecord::Base

  #---------- ASSOCIATIONS ----------------- 

  belongs_to :user
  belongs_to :pupil, :class_name => 'User'

  # Join table to add courses to posts
  has_many :enrolments, :dependent => :destroy
  has_many :courses, :through => :enrolments, :before_remove => [:send_unenrolled_notification, :remove_from_forum] 

  # Polymorphic associations
  has_one :forum, as: :forumable, :dependent => :destroy
  has_many :notifications, as: :notifiable, :dependent => :destroy

  
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
    user.students.include?(self) || user != nil
  end

  def is_updatable_by(user, parent = nil)
    user != nil
  end

  def is_deletable_by(user, parent = nil)
    user != nil
  end


  #---------- SCOPES ----------------- 


  scope :confirmed, -> { where(:status => true) }
  scope :declined, -> { where(:response => 'Declined') }
  scope :pending, -> { where(:response => 'Pending') }
  scope :pupils, ->(id) { where(:pupil_id => id) }
  scope :tutor, ->(id) { where(:user_id => id) }
  scope :with_ids, ->(id) { where(:id => id) }


  #----------  VIRTUAL ATTRIBUTES  ----------------- 

  # student name
  def students_name
    self.pupil.title
  end

  #  tutor name
  def tutor_name
    self.user.title
  end

  #---------- CALLBACKS ----------------- 

  after_create :build_forum
  after_create :send_notification 
  after_update :send_reply
  before_destroy :remove_course_forum, :send_deletion_notification, :delete_appointments

  # Builds a new private forum for the tutor and student
  def build_forum
  	@forum = Forum.create(:title => 'Student - Tutor Forum', :description => self.user.title + ' and ' + self.pupil.title, :forumable_id => self.id, :forumable_type => 'Student')
  	ForumContributor.create(:forum_id => @forum.id, :user_id => self.user.id)
  	ForumContributor.create(:forum_id => @forum.id, :user_id => self.pupil.id)
  end

  # Sends invitation notification
  def send_notification
    @notifiable = self
    @sender = User.find(self.user_id)
    @receiver = User.find(self.pupil_id)
    @notifiable.notifications.create(:user => @sender, :receiver_id => @receiver.id, :message =>  @sender.title + ' has invited you to join them as their student')
  end

  # Sends response to invitation
  def send_reply
    if self.response_changed?
      @notifiable = self
      @tutor = User.find(self.user_id)
      @student = User.find(self.pupil_id)

      if self.response == "Declined"
        @description = self.pupil.title  + " has sadly declined your offer"
        @notifiable.notifications.create(:user => @tutor ,:receiver_id => @student.id, :message => 'You hve declined the offer by ' + @tutor.title)
      else
        @description = self.pupil.title + " is now a student at your school"
        @notifiable.notifications.create(:user => @tutor ,:receiver_id => @student.id, :message => 'You are now a student of ' + @tutor.title)
      end
      @notifiable.notifications.create(:user => @student, :receiver_id => @tutor.id, :message => @description)
    end
  end

  # Removes a student from all there associated forums
  def remove_course_forum
    @student_forums = ForumContributor.where(:user_id => self.pupil_id)
    @student_forums.each do |f|
        f.destroy
    end
  end

  # Removes a student from all there associated forums
  def delete_appointments
    @appointments = Appointment.my_appointment.where(self.pupil_id)
    @appointments.destroy_all
  end

  # Send un-subcribed notification to the student
  def send_deletion_notification
    @notifiable = self
    @tutor = User.find(self.user_id)
    @student = User.find(self.pupil_id)
    Notification.create(:user => @tutor, :receiver_id => @student.id, :message =>  @tutor.title + ' has removed you from their student list')
  end

  def send_unenrolled_notification(course)
      @notifiable = self
      @course = course
      @sender = User.find(@course.user_id)
      @reciever = User.find(@notifiable.pupil_id)
      @notifiable.notifications.create(:user => @sender, :receiver_id => @reciever.id, :message => 'You have been un-enrolled on ' + @course.title)
  end

  def remove_from_forum(course)
    @forum = Forum.where(:forumable_id => course.id, :forumable_type => 'Course').first
    @contributor =  ForumContributor.where(:forum_id => @forum.id, :user_id => self.pupil.id)
    @contributor.each do |c|
      c.destroy
    end
  end

end
