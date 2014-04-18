class RemakeForums < ActiveRecord::Migration
  def change
  	drop_table :forums
  	  create_table :forums do |t|
      t.string :title
      t.string :description
      t.belongs_to :administrator, index: true
	  t.attachment :avatar
	  t.integer :forumable_id
	  t.string :forumable_type
      t.timestamps
    end
  end
end
