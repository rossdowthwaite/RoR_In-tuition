class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :forums, :administrator_id, :user_id
  end
end
