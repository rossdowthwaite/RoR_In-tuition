class CreateForumContributors < ActiveRecord::Migration
  def change
    create_table :forum_contributors do |t|
      t.belongs_to :contributor, index: true
      t.belongs_to :forum, index: true

      t.timestamps
    end
  end
end
