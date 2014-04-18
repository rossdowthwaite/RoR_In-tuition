class AddColumnsToForums < ActiveRecord::Migration
  def change
  	add_column :forums, :forumable_id, :integer
  	add_column :forums, :forumable_type, :string

  	remove_column :forums, :course_id
  end
end
