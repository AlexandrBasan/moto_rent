require "spec_helper"

describe DestinationFaresController do
  describe "routing" do

    it "routes to #index" do
      get("/destination_fares").should route_to("destination_fares#index")
    end

    it "routes to #new" do
      get("/destination_fares/new").should route_to("destination_fares#new")
    end

    it "routes to #show" do
      get("/destination_fares/1").should route_to("destination_fares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/destination_fares/1/edit").should route_to("destination_fares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/destination_fares").should route_to("destination_fares#create")
    end

    it "routes to #update" do
      put("/destination_fares/1").should route_to("destination_fares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/destination_fares/1").should route_to("destination_fares#destroy", :id => "1")
    end

  end
end
