require 'spec_helper'

describe "destination_fares/edit" do
  before(:each) do
    @destination_fare = assign(:destination_fare, stub_model(DestinationFare,
      :vehicletype_id => 1,
      :destination_id => 1,
      :dest_fare => "9.99"
    ))
  end

  it "renders the edit destination_fare form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", destination_fare_path(@destination_fare), "post" do
      assert_select "input#destination_fare_vehicletype_id[name=?]", "destination_fare[vehicletype_id]"
      assert_select "input#destination_fare_destination_id[name=?]", "destination_fare[destination_id]"
      assert_select "input#destination_fare_dest_fare[name=?]", "destination_fare[dest_fare]"
    end
  end
end
