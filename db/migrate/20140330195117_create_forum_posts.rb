class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.belongs_to :forum, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
