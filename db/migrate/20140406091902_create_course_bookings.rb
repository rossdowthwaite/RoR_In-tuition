class CreateCourseBookings < ActiveRecord::Migration
  def change
    create_table :course_bookings do |t|
      t.belongs_to :course, index: true
      t.belongs_to :booking, index: true

      t.timestamps
    end
  end
end
