class Qualification < ActiveRecord::Base
  belongs_to :user

  #---------- VALIDATIONS ----------------- 

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

end
