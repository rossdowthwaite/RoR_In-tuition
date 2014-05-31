class CreateExampleCodes < ActiveRecord::Migration
  def change
    create_table :example_codes do |t|
      t.string :example_string
      t.integer :example_int
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
