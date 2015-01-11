require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :name => "Name",
      :language => "Language",
      :review => "Review",
      :show => false,
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Language/)
    rendered.should match(/Review/)
    rendered.should match(/false/)
    rendered.should match(/Link/)
  end
end
