class AddColumnsToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :status, :string
  	add_column :students, :response, :string
  end
end
