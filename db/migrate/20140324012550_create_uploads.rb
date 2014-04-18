class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.attachment :upload
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
