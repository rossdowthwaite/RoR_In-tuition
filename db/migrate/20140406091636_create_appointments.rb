class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking, index: true
      t.boolean :owner
      t.boolean :confirmed

      t.timestamps
    end
  end
end
