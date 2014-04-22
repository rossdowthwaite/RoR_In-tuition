class Goal < ActiveRecord::Base
  belongs_to :user

  validates :aim, presence: true
  validates :aim, length: { maximum: 140 }
  
end
