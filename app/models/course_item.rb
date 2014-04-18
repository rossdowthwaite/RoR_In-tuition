class CourseItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :course

  scope :profiled, -> { where(:show_in_profile => true)}
end
