class Material < ActiveRecord::Base
  belongs_to :topic
  belongs_to :medium, :polymorphic => true
end
