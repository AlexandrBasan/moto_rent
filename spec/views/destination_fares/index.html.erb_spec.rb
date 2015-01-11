require 'spec_helper'

describe "destination_fares/index" do
  before(:each) do
    assign(:destination_fares, [
      stub_model(DestinationFare,
        :vehicletype_id => 1,
        :destination_id => 2,
        :dest_fare => "9.99"
      ),
      stub_model(DestinationFare,
        :vehicletype_id => 1,
        :destination_id => 2,
        :dest_fare => "9.99"
      )
    ])
  end

  it "renders a list of destination_fares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
