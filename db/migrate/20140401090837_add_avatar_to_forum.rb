class AddAvatarToForum < ActiveRecord::Migration
  def change
  	add_column :forums, :avatar, :attachment
  end
end
