class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.belongs_to :topic, index: true
      t.integer :medium_id, index: true
      t.string :medium_type, index: true

      t.timestamps
    end
  end
end
