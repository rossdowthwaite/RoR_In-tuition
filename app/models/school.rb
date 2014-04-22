class School < ActiveRecord::Base

  belongs_to :user

  has_many :school_courses
  has_many :courses, :through => :school_courses

  has_many :locations, as: :addressable

  has_one :profile, as: :profilable

  # logo file attament data
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :post => "50x50>", :home => "200x200>", :mini => "50x50>"}
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  #---------- VALIDATIONS ----------------- 

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  #---------- HOOKS ----------------- 

  after_create :build_profile

  	def build_profile
		Profile.create(:profilable_type => 'School', :profilable_id => self.id)
	end

end
