class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.belongs_to :user, index: true
      t.string :quality

      t.timestamps
    end
  end
end
