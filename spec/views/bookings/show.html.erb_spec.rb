require 'spec_helper'

describe "bookings/show" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :user_id => 1,
      :supplier_id => 2,
      :v_type_id => 3,
      :inquiry_id => "Inquiry",
      :airport_id => 4,
      :status => "Status",
      :type => "Type",
      :arrival_airline => "Arrival Airline",
      :arrival_flight_number => "Arrival Flight Number",
      :arrival_fliyng_from => "Arrival Fliyng From",
      :departure_airlines => "Departure Airlines",
      :departure_flight_number => "Departure Flight Number",
      :price => "9.99",
      :arrival_address_line_1 => "Arrival Address Line 1",
      :arrival_address_line_2 => "Arrival Address Line 2",
      :departure_address_line_1 => "Departure Address Line 1",
      :departure_address_line_2 => "Departure Address Line 2",
      :passengers => 5,
      :baggages => 6,
      :hand_laggages => 7,
      :baby => 8,
      :child => 9,
      :booster => "Booster",
      :special_requirements => "Special Requirements"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Inquiry/)
    rendered.should match(/4/)
    rendered.should match(/Status/)
    rendered.should match(/Type/)
    rendered.should match(/Arrival Airline/)
    rendered.should match(/Arrival Flight Number/)
    rendered.should match(/Arrival Fliyng From/)
    rendered.should match(/Departure Airlines/)
    rendered.should match(/Departure Flight Number/)
    rendered.should match(/9.99/)
    rendered.should match(/Arrival Address Line 1/)
    rendered.should match(/Arrival Address Line 2/)
    rendered.should match(/Departure Address Line 1/)
    rendered.should match(/Departure Address Line 2/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/Booster/)
    rendered.should match(/Special Requirements/)
  end
end
