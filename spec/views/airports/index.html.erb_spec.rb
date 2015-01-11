require 'spec_helper'

describe "airports/index" do
  before(:each) do
    assign(:airports, [
      stub_model(Airport,
        :code => "Code",
        :cc_fips => "Cc Fips",
        :name => "Name",
        :lat => "9.99",
        :long => "9.99",
        :fixed_fare => "9.99"
      ),
      stub_model(Airport,
        :code => "Code",
        :cc_fips => "Cc Fips",
        :name => "Name",
        :lat => "9.99",
        :long => "9.99",
        :fixed_fare => "9.99"
      )
    ])
  end

  it "renders a list of airports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Cc Fips".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
