class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :supplier_id
      t.integer :v_type_id
      t.string :inquiry_id
      t.integer :airport_id
      t.string :status
      t.string :type
      t.string :arrival_airline
      t.string :arrival_flight_number
      t.string :arrival_fliyng_from
      t.datetime :arrival_date
      t.datetime :arrival_time
      t.string :departure_airlines
      t.string :departure_flight_number
      t.datetime :departure_date
      t.datetime :departure_time
      t.datetime :arrival_pick_up_time
      t.datetime :departure_pick_up_time
      t.decimal :price
      t.string :arrival_address_line_1
      t.string :arrival_address_line_2
      t.string :departure_address_line_1
      t.string :departure_address_line_2
      t.integer :passengers
      t.integer :baggages
      t.integer :hand_laggages
      t.integer :baby
      t.integer :child
      t.string :booster
      t.string :special_requirements

      t.timestamps
    end
  end
end
