class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :video_url

      t.timestamps
    end
  end
end
