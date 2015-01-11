require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :name => "MyString",
      :language => "MyString",
      :review => "MyString",
      :show => false,
      :link => "MyString"
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_name[name=?]", "review[name]"
      assert_select "input#review_language[name=?]", "review[language]"
      assert_select "input#review_review[name=?]", "review[review]"
      assert_select "input#review_show[name=?]", "review[show]"
      assert_select "input#review_link[name=?]", "review[link]"
    end
  end
end
