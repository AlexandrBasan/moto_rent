class RenameBookingType < ActiveRecord::Migration
  def change
    rename_column :bookings, :type, :booking_type
    rename_column :bookings, :inquiry_id, :booking_number
  end
end
