class Text < ActiveRecord::Base

  belongs_to :user

  has_many :materials, as: :medium, dependent: :destroy
  has_many :topics, :through => :materials

  def text_content
  	simple_format(content)
  end

end
