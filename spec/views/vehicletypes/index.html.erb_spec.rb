require 'spec_helper'

describe "vehicletypes/index" do
  before(:each) do
    assign(:vehicletypes, [
      stub_model(Vehicletype,
        :vtype => "Vtype",
        :vdescription => "Vdescription",
        :image => "Image",
        :passnum => 1,
        :bagagenum => 2
      ),
      stub_model(Vehicletype,
        :vtype => "Vtype",
        :vdescription => "Vdescription",
        :image => "Image",
        :passnum => 1,
        :bagagenum => 2
      )
    ])
  end

  it "renders a list of vehicletypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vtype".to_s, :count => 2
    assert_select "tr>td", :text => "Vdescription".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
