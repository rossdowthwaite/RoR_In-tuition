class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, :dependent => :destroy

  has_many :forum_posts, dependent: :destroy
  has_many :forums, :through => :forum_posts

  has_many :notifications, as: :notifiable, :dependent => :destroy



#---------- AUTHENTICATION ----------------- 

 # This method checks permissions for the :index action
  def self.is_indexable_by(user, parent = nil)
    user.is_admin?
  end

  # This method checks permissions for the :create and :new action
  def self.is_creatable_by(user, parent = nil)
    user != nil
  end

  # This method checks permissions for the :show action
  def is_readable_by(user, parent = nil)
    user.is_admin?
  end

  # This method checks permissions for the :update and :edit action
  def is_updatable_by(user, parent = nil)
    user.posts.include?(self)
  end

  # This method checks permissions for the :destroy action
  def is_deletable_by(user, parent = nil)
    user.posts.include?(self)
  end

end
