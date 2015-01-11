class RenameBooking < ActiveRecord::Migration
  def change
    rename_column :bookings, :v_type_id, :vehicletype_id
  end
end
