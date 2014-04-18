class RemakeStudents < ActiveRecord::Migration
  def change
  	drop_table :students

	   create_table :students do |t|
	      t.belongs_to :user, index: true
	      t.belongs_to :pupil, index: true
	      t.string :response
	      t.boolean :status
	      t.timestamps
	    end
  end
end
