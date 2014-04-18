class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.belongs_to :course, index: true
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
