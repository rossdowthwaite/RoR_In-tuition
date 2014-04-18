class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
