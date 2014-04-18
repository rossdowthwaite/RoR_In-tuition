class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user, index: true
      t.string :aim

      t.timestamps
    end
  end
end
