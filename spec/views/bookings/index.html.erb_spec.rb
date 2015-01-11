require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
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
      ),
      stub_model(Booking,
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
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Inquiry".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Arrival Airline".to_s, :count => 2
    assert_select "tr>td", :text => "Arrival Flight Number".to_s, :count => 2
    assert_select "tr>td", :text => "Arrival Fliyng From".to_s, :count => 2
    assert_select "tr>td", :text => "Departure Airlines".to_s, :count => 2
    assert_select "tr>td", :text => "Departure Flight Number".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Arrival Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Arrival Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "Departure Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Departure Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => "Booster".to_s, :count => 2
    assert_select "tr>td", :text => "Special Requirements".to_s, :count => 2
  end
end
