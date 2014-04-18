class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.string :content
      t.integer :commentable_id
      t.string :commentable_type
    end
  end
end
