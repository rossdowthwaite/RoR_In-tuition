class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
