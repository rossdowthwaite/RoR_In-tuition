class ForumContributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum

  has_many :notifications, as: :notifiable, :dependent => :destroy

  after_create :send_notification

  scope :contributor, -> (id) {where(:user_id => id)}

  def send_notification
  	@notifiable = self
  	@sender = self.user
  	@receiver = self.user
  	@notifiable.notifications.create(:user => @sender, :receiver_id => @receiver.id, :message => 'You have been added to a forum - ' + self.forum.title)
  end 
end
