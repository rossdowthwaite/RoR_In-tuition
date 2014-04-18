class SubjectTopic < ActiveRecord::Base
  belongs_to :subject
  belongs_to :topic
end
