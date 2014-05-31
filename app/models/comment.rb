class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  has_many :notifications, as: :notifiable, :dependent => :destroy

#---------- Validations -----------------  

validates :content, length: { maximum: 250 }


#---------- AUTHENTICATION ----------------- 

 # this functionality was implemented using the RESTful_ACL gem 
 # and by following this tutorial - http://everydayrails.com/2010/06/16/authorization-restful-acl-1.html 
 # full referencses can be found in the full report reference page - [51][45]

  def self.is_indexable_by(user, parent = nil)
    user.is_admin?
  end

  def self.is_creatable_by(user, parent = nil)
    user != nil
  end

  def is_readable_by(user, parent = nil)
    user != nil
  end

  def is_updatable_by(user, parent = nil)
    user.comments.include?(self)
  end

  def is_deletable_by(user, parent = nil)
    user.comments.include?(self)
  end

#---------- HOOKS ----------------- 

  after_create :send_notification

  def send_notification
    if self.commentable_type == 'Post'
      send_forum_notification
    end
    if self.commentable_type == 'Booking'
      send_booking_notification
    end
  end

  def send_booking_notification
    @notifiable = self
    @sender = self.user
    @receivers = self.commentable.appointments
    @receivers.each do |rec|
      if rec.user != @sender
        @notifiable.notifications.create(:user => @sender, :receiver_id => rec.user_id, :message =>  @sender.title + ' commented on your Booking')
      end
    end
  end 

  def send_forum_notification
    @notifiable = self
    @sender = self.user
    @receiver = self.commentable.user
    @notifiable.notifications.create(:user => @sender, :receiver_id => @receiver.id, :message =>  @sender.title + ' commented on your Post')
  end

end
