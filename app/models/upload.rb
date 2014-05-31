class Upload < ActiveRecord::Base
  belongs_to :user

  # Polymorphic - Materials
  has_many :materials, as: :medium, dependent: :destroy
  has_many :topics, :through => :materials

  # upload file attament data
  has_attached_file :upload, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :home => "200x200>", :mini => "50x50>"}
  validates_attachment_content_type :upload, :content_type => ["application/pdf", 'image/jpeg', 'image/jpg', 'image/png']

  #---------- VALIDATIONS -----------------

  validates :upload, presence: true
  validates :title, length: { maximum: 50 }
  validates :title, presence: true

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
	  	user.uploads.include?(self)
	  end

	  def is_updatable_by(user, parent = nil)
	  	user.uploads.include?(self)
	  end

	  def is_deletable_by(user, parent = nil)
	  	user.uploads.include?(self)
	  end

end
