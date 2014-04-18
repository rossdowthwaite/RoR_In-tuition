class RenaeColumnInForumContributors < ActiveRecord::Migration
  def change
  	rename_column :forum_contributors, :contributor_id, :user_id
  end
end
