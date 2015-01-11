require 'spec_helper'

describe "airports/new" do
  before(:each) do
    assign(:airport, stub_model(Airport,
      :code => "MyString",
      :cc_fips => "MyString",
      :name => "MyString",
      :lat => "9.99",
      :long => "9.99",
      :fixed_fare => "9.99"
    ).as_new_record)
  end

  it "renders new airport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", airports_path, "post" do
      assert_select "input#airport_code[name=?]", "airport[code]"
      assert_select "input#airport_cc_fips[name=?]", "airport[cc_fips]"
      assert_select "input#airport_name[name=?]", "airport[name]"
      assert_select "input#airport_lat[name=?]", "airport[lat]"
      assert_select "input#airport_long[name=?]", "airport[long]"
      assert_select "input#airport_fixed_fare[name=?]", "airport[fixed_fare]"
    end
  end
end
