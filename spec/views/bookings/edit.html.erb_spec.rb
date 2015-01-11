require 'spec_helper'

describe "bookings/edit" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :user_id => 1,
      :supplier_id => 1,
      :v_type_id => 1,
      :inquiry_id => "MyString",
      :airport_id => 1,
      :status => "MyString",
      :type => "",
      :arrival_airline => "MyString",
      :arrival_flight_number => "MyString",
      :arrival_fliyng_from => "MyString",
      :departure_airlines => "MyString",
      :departure_flight_number => "MyString",
      :price => "9.99",
      :arrival_address_line_1 => "MyString",
      :arrival_address_line_2 => "MyString",
      :departure_address_line_1 => "MyString",
      :departure_address_line_2 => "MyString",
      :passengers => 1,
      :baggages => 1,
      :hand_laggages => 1,
      :baby => 1,
      :child => 1,
      :booster => "MyString",
      :special_requirements => "MyString"
    ))
  end

  it "renders the edit booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do
      assert_select "input#booking_user_id[name=?]", "booking[user_id]"
      assert_select "input#booking_supplier_id[name=?]", "booking[supplier_id]"
      assert_select "input#booking_v_type_id[name=?]", "booking[v_type_id]"
      assert_select "input#booking_inquiry_id[name=?]", "booking[inquiry_id]"
      assert_select "input#booking_airport_id[name=?]", "booking[airport_id]"
      assert_select "input#booking_status[name=?]", "booking[status]"
      assert_select "input#booking_type[name=?]", "booking[type]"
      assert_select "input#booking_arrival_airline[name=?]", "booking[arrival_airline]"
      assert_select "input#booking_arrival_flight_number[name=?]", "booking[arrival_flight_number]"
      assert_select "input#booking_arrival_fliyng_from[name=?]", "booking[arrival_fliyng_from]"
      assert_select "input#booking_departure_airlines[name=?]", "booking[departure_airlines]"
      assert_select "input#booking_departure_flight_number[name=?]", "booking[departure_flight_number]"
      assert_select "input#booking_price[name=?]", "booking[price]"
      assert_select "input#booking_arrival_address_line_1[name=?]", "booking[arrival_address_line_1]"
      assert_select "input#booking_arrival_address_line_2[name=?]", "booking[arrival_address_line_2]"
      assert_select "input#booking_departure_address_line_1[name=?]", "booking[departure_address_line_1]"
      assert_select "input#booking_departure_address_line_2[name=?]", "booking[departure_address_line_2]"
      assert_select "input#booking_passengers[name=?]", "booking[passengers]"
      assert_select "input#booking_baggages[name=?]", "booking[baggages]"
      assert_select "input#booking_hand_laggages[name=?]", "booking[hand_laggages]"
      assert_select "input#booking_baby[name=?]", "booking[baby]"
      assert_select "input#booking_child[name=?]", "booking[child]"
      assert_select "input#booking_booster[name=?]", "booking[booster]"
      assert_select "input#booking_special_requirements[name=?]", "booking[special_requirements]"
    end
  end
end
