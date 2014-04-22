class Product < ActiveRecord::Base
  belongs_to :user

  #---------- VALIDATIONS ----------------- 

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 50 }
  validates :price, :format => { :with => /\A(\\z)?(\d+)(\.|,)?\d{0,2}?\z/ }, :numericality => {:greater_than => 0}

end
