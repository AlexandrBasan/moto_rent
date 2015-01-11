class Destroybookingfields < ActiveRecord::Migration
  def change
    remove_column :bookings, :arrival_time
    remove_column :bookings, :departure_time
  end
end
