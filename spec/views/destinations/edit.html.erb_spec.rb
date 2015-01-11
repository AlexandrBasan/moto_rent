require 'spec_helper'

describe "destinations/edit" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination,
      :airport_id => 1,
      :name => "MyString",
      :address => "MyString",
      :address_description => "MyString",
      :distance => "9.99",
      :lat => "9.99",
      :long => "9.99"
    ))
  end

  it "renders the edit destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", destination_path(@destination), "post" do
      assert_select "input#destination_airport_id[name=?]", "destination[airport_id]"
      assert_select "input#destination_name[name=?]", "destination[name]"
      assert_select "input#destination_address[name=?]", "destination[address]"
      assert_select "input#destination_address_description[name=?]", "destination[address_description]"
      assert_select "input#destination_distance[name=?]", "destination[distance]"
      assert_select "input#destination_lat[name=?]", "destination[lat]"
      assert_select "input#destination_long[name=?]", "destination[long]"
    end
  end
end
