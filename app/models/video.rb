class Video < ActiveRecord::Base
  belongs_to :user
  has_many :materials, as: :medium, dependent: :destroy
  has_many :topics, :through => :materials

  #---------- Validations -----------------  

  validates :title, length: { maximum: 50 }
  validates :title, presence: true

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
	  	user.videos.include?(self)
	  end

	  # This method checks permissions for the :update and :edit action
	  def is_updatable_by(user, parent = nil)
	  	user.videos.include?(self)
	  end

	  # This method checks permissions for the :destroy action
	  def is_deletable_by(user, parent = nil)
	  	user.videos.include?(self)
	  end

end
