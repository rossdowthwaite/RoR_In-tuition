class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :reciever, :class_name => "User", :foreign_key => :reciever
  belongs_to :notifiable, :polymorphic => true

  scope :my_notifications, ->(id) { where(:receiver_id => id)}
  scope :new_notifications, -> { where(:seen_at => nil)}
end
