class AddColumnToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :booker, index: true
  end
end
