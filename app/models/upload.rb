class Upload < ActiveRecord::Base
  belongs_to :user

  # Polymorphic - Materials
  has_many :materials, as: :medium, dependent: :destroy
  has_many :topics, :through => :materials

  # upload file attament data
  has_attached_file :upload, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :home => "200x200>", :mini => "50x50>"}
  validates_attachment_content_type :upload, :content_type => ["application/pdf", 'image/jpeg', 'image/jpg', 'image/png']

  validates :upload, presence: true

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
	  	user.uploads.include?(self)
	  end

	  # This method checks permissions for the :update and :edit action
	  def is_updatable_by(user, parent = nil)
	  	user.uploads.include?(self)
	  end

	  # This method checks permissions for the :destroy action
	  def is_deletable_by(user, parent = nil)
	  	user.uploads.include?(self)
	  end

end
