class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :bio
      t.string :profilable_type
      t.integer :profilable_id

      t.timestamps
    end
  end
end
