require 'spec_helper'

describe "vehicletypes/new" do
  before(:each) do
    assign(:vehicletype, stub_model(Vehicletype,
      :vtype => "MyString",
      :vdescription => "MyString",
      :image => "MyString",
      :passnum => 1,
      :bagagenum => 1
    ).as_new_record)
  end

  it "renders new vehicletype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicletypes_path, "post" do
      assert_select "input#vehicletype_vtype[name=?]", "vehicletype[vtype]"
      assert_select "input#vehicletype_vdescription[name=?]", "vehicletype[vdescription]"
      assert_select "input#vehicletype_image[name=?]", "vehicletype[image]"
      assert_select "input#vehicletype_passnum[name=?]", "vehicletype[passnum]"
      assert_select "input#vehicletype_bagagenum[name=?]", "vehicletype[bagagenum]"
    end
  end
end
