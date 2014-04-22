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


  scope :is_for, ->(type) { where(:forumable_type => type) }
  scope :with_id, ->(id) { where(:forumable_id => id) }

  #---------- AUTHENTICATION ----------------- 

 # This method checks permissions for the :index action
  def self.is_indexable_by(user, parent = nil)
    user != nil
  end

  # This method checks permissions for the :create and :new action
  def self.is_creatable_by(user, parent = nil)
    user != nil
  end

  # This method checks permissions for the :show action
  def is_readable_by(user, parent = nil)
    user.forums.include?(self)
  end

  # This method checks permissions for the :update and :edit action
  def is_updatable_by(user, parent = nil)
    user.forums.include?(self)
  end

  # This method checks permissions for the :destroy action
  def is_deletable_by(user, parent = nil)
    user.forums.include?(self)
  end

end
