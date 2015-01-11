require 'spec_helper'

describe "DestinationFares" do
  describe "GET /destination_fares" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get destination_fares_path
      response.status.should be(200)
    end
  end
end
