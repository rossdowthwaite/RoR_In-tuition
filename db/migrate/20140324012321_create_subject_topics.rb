class CreateSubjectTopics < ActiveRecord::Migration
  def change
    create_table :subject_topics do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :topic, index: true

      t.timestamps
    end
  end
end
