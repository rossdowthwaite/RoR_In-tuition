class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :receiver, index: true
      t.string :notifiable_type
      t.integer :notifiable_id
      t.string :message

      t.timestamps
    end
  end
end
