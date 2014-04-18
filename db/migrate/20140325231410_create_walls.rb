class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.belongs_to :course, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
