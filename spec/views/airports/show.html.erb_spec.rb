require 'spec_helper'

describe "airports/show" do
  before(:each) do
    @airport = assign(:airport, stub_model(Airport,
      :code => "Code",
      :cc_fips => "Cc Fips",
      :name => "Name",
      :lat => "9.99",
      :long => "9.99",
      :fixed_fare => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Cc Fips/)
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
