class Enrolment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  has_many :notifications, as: :notifiable, :dependent => :destroy

  after_create :add_to_course_forum
  before_destroy :remove_from_course_forum

  after_create :send_notification
  before_destroy :unenrolled_notification 

  scope :my_enrolments, ->(id) { where(:student_id => id) }
  scope :on_course, ->(id) { where(:course_id => id) }

  def add_to_course_forum
  	@forum = Forum.where(:forumable_id => self.course_id, :forumable_type => 'Course').first
  	ForumContributor.create(:forum_id => @forum.id, :user_id => self.student.pupil.id)
  end

  def remove_from_course_forum
  	@forum = Forum.where(:forumable_id => self.course_id, :forumable_type => 'Course').first
  	@contributor =  ForumContributor.where(:forum_id => @forum.id, :user_id => self.student.pupil.id)
  	@contributor.each do |c|
      c.destroy
    end
  end

  def send_notification
    @notifiable = self
    @tutor = User.find(self.course.user_id)
    @student = User.find(self.student.pupil_id)
    @notifiable.notifications.create(:user => @tutor, :receiver_id => @student.id, :message =>  @tutor.title + ' has enrolled you on their course - ' + self.course.title)
  end

  def unenrolled_notification
    @notifiable = self
    @tutor = User.find(self.course.user_id)
    @student = User.find(self.student.pupil_id)
    @notifiable.notifications.create(:user => @tutor, :receiver_id => @student.id, :message =>  @tutor.title + ' has un-enrolled you on their course - ' + self.course.title)
  end


end
