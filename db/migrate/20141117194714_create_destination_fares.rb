class CreateDestinationFares < ActiveRecord::Migration
  def change
    create_table :destination_fares do |t|
      t.integer :vehicletype_id
      t.integer :destination_id
      t.decimal :dest_fare

      t.timestamps
    end
  end
end
