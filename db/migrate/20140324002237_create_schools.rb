class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :title
      t.string :description
      t.attachment :logo
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
