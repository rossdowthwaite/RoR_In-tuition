class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :county
      t.string :country
      t.string :p_code
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
