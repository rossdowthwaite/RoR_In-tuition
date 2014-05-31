class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, :dependent => :destroy

  has_many :forum_posts, dependent: :destroy
  has_many :forums, :through => :forum_posts

  has_many :notifications, as: :notifiable, :dependent => :destroy

  #---------- Validations -----------------  

  validates :content, length: { maximum: 500 }




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
    user.is_admin?
  end

  def is_updatable_by(user, parent = nil)
    user.posts.include?(self)
  end

  def is_deletable_by(user, parent = nil)
    user.posts.include?(self)
  end

end
