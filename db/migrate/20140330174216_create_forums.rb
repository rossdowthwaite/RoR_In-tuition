class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.string :description
      t.belongs_to :administrator, index: true

      t.timestamps
    end
  end
end
