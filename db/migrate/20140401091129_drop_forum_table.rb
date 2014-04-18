class DropForumTable < ActiveRecord::Migration
  def change
  	drop_table :forums

    create_table :forums do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, index: true
      t.attachment :avatar

      t.timestamps
    end
  end
end
