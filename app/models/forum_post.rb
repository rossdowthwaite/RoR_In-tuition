class ForumPost < ActiveRecord::Base
  belongs_to :forum
  belongs_to :post

  has_many :notifications, as: :notifiable, :dependent => :destroy

  after_create :send_notification

  scope :from_forums, -> (id) {where(:forum_id => id)}
  scope :with_post_id, -> (id) {where(:post_id => id)}

  def send_notification
  	@notifiable = self
  	@sender = self.post.user
  	@receivers = self.forum.forum_contributors
  	@receivers.each do |rec|
      if rec.user.id != @sender.id
  		  @notifiable.notifications.create(:user => @sender, :receiver_id => rec.user.id, :message =>  @sender.title + ' has made a post')
      end
  	end
  end 

end
