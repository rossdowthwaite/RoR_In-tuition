class Profile < ActiveRecord::Base
	belongs_to :profilable, :polymorphic => true

	validates :bio, length: { maximum: 500 }
end
