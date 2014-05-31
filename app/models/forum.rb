class Forum < ActiveRecord::Base
	has_many :forum_contributors
	has_many :users, :through => :forum_contributors

	has_many :forum_posts
  has_many :posts, :through => :forum_posts, dependent: :destroy

  belongs_to :forumable, :polymorphic => true
  has_many :notifications, as: :notifiable, :dependent => :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :student => "210x210>", :home => "200x200>", :mini => "50x50>"}
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  #---------- VALIDATIONS ----------------- 

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }


  #---------- SCOPES ----------------- 

  scope :is_for, ->(type) { where(:forumable_type => type) }
  scope :with_id, ->(id) { where(:forumable_id => id) }

  #---------- AUTHENTICATION ----------------- 

 # this functionality was implemented using the RESTful_ACL gem 
 # and by following this tutorial - http://everydayrails.com/2010/06/16/authorization-restful-acl-1.html 
 # full referencses can be found in the full report reference page - [51][45]

  def self.is_indexable_by(user, parent = nil)
    user != nil || user.is_admin?
  end

  def self.is_creatable_by(user, parent = nil)
    user != nil || user.is_admin?
  end

  def is_readable_by(user, parent = nil)
    user.forums.include?(self) || user.is_admin?
  end

  def is_updatable_by(user, parent = nil)
    user.forums.include?(self) || user.is_admin?
  end

  def is_deletable_by(user, parent = nil)
    user.forums.include?(self) || user.is_admin?
  end

end
