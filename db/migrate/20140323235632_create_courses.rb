class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.attachment :logo
      t.boolean :active
      t.string :search_tags
      t.belongs_to :user

      t.timestamps
    end
  end
end
