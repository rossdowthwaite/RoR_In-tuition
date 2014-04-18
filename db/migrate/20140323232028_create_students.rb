class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.belongs_to :user, index: true
      t.belongs_to :pupil, index: true

      t.timestamps
    end
  end
end
