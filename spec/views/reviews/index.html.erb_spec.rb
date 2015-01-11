require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :name => "Name",
        :language => "Language",
        :review => "Review",
        :show => false,
        :link => "Link"
      ),
      stub_model(Review,
        :name => "Name",
        :language => "Language",
        :review => "Review",
        :show => false,
        :link => "Link"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Review".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
