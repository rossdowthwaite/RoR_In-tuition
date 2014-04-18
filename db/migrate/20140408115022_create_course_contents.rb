class CreateCourseContents < ActiveRecord::Migration
  def change
    create_table :course_contents do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
