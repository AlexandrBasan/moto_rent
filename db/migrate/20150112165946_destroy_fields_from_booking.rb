class DestroyFieldsFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :arrival_airline
    remove_column :bookings, :arrival_flight_number
    remove_column :bookings, :arrival_fliyng_from
    remove_column :bookings, :departure_airlines
    remove_column :bookings, :departure_flight_number
    remove_column :bookings, :passengers
    remove_column :bookings, :hand_laggages
    remove_column :bookings, :baby
    remove_column :bookings, :child
    remove_column :bookings, :special_requirements
    remove_column :bookings, :baggages
    remove_column :bookings, :booster

    rename_column :bookings, :arrival_date, :start_date
    rename_column :bookings, :departure_date, :end_date
  end
end
