class DropTables < ActiveRecord::Migration
  def change
  	drop_table :class_rooms
  	drop_table :walls
  end
end
