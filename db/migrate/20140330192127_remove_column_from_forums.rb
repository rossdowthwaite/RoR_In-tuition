class RemoveColumnFromForums < ActiveRecord::Migration
  def change
  	drop_table :forums

  	create_table :forums do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
    
  end
end
