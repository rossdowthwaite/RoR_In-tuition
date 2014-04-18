class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
