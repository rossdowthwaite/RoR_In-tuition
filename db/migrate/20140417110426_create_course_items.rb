class CreateCourseItems < ActiveRecord::Migration
  def change
    create_table :course_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :course, index: true
      t.boolean :show_in_profile

      t.timestamps
    end
  end
end
