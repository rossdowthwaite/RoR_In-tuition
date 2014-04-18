class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
