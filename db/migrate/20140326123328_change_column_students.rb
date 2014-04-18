class ChangeColumnStudents < ActiveRecord::Migration
  def change
  	change_column :students, :status, :boolean
  end
end
