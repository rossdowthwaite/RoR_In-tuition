class Qualification < ActiveRecord::Base
  belongs_to :user

  #---------- VALIDATIONS ----------------- 

  validates :quality, presence: true
  validates :quality, length: { maximum: 140 }

end
