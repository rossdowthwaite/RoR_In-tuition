class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :title
      t.string :description
      t.date :start
      t.date :end
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
