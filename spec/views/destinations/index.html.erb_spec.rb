require 'spec_helper'

describe "destinations/index" do
  before(:each) do
    assign(:destinations, [
      stub_model(Destination,
        :airport_id => 1,
        :name => "Name",
        :address => "Address",
        :address_description => "Address Description",
        :distance => "9.99",
        :lat => "9.99",
        :long => "9.99"
      ),
      stub_model(Destination,
        :airport_id => 1,
        :name => "Name",
        :address => "Address",
        :address_description => "Address Description",
        :distance => "9.99",
        :lat => "9.99",
        :long => "9.99"
      )
    ])
  end

  it "renders a list of destinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
