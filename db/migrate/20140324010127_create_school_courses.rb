class CreateSchoolCourses < ActiveRecord::Migration
  def change
    create_table :school_courses do |t|
      t.belongs_to :course, index: true
      t.belongs_to :school, index: true

      t.timestamps
    end
  end
end
