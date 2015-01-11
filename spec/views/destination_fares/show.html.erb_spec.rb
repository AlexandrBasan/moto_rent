require 'spec_helper'

describe "destination_fares/show" do
  before(:each) do
    @destination_fare = assign(:destination_fare, stub_model(DestinationFare,
      :vehicletype_id => 1,
      :destination_id => 2,
      :dest_fare => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
