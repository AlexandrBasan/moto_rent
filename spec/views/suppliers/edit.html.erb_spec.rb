require 'spec_helper'

describe "suppliers/edit" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :user_id => 1,
      :address => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do
      assert_select "input#supplier_user_id[name=?]", "supplier[user_id]"
      assert_select "input#supplier_address[name=?]", "supplier[address]"
      assert_select "input#supplier_name[name=?]", "supplier[name]"
    end
  end
end
