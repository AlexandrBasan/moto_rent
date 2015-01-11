require 'spec_helper'

describe "vehicletypes/show" do
  before(:each) do
    @vehicletype = assign(:vehicletype, stub_model(Vehicletype,
      :vtype => "Vtype",
      :vdescription => "Vdescription",
      :image => "Image",
      :passnum => 1,
      :bagagenum => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vtype/)
    rendered.should match(/Vdescription/)
    rendered.should match(/Image/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
