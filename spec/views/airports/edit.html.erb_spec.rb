require 'spec_helper'

describe "airports/edit" do
  before(:each) do
    @airport = assign(:airport, stub_model(Airport,
      :code => "MyString",
      :cc_fips => "MyString",
      :name => "MyString",
      :lat => "9.99",
      :long => "9.99",
      :fixed_fare => "9.99"
    ))
  end

  it "renders the edit airport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", airport_path(@airport), "post" do
      assert_select "input#airport_code[name=?]", "airport[code]"
      assert_select "input#airport_cc_fips[name=?]", "airport[cc_fips]"
      assert_select "input#airport_name[name=?]", "airport[name]"
      assert_select "input#airport_lat[name=?]", "airport[lat]"
      assert_select "input#airport_long[name=?]", "airport[long]"
      assert_select "input#airport_fixed_fare[name=?]", "airport[fixed_fare]"
    end
  end
end
