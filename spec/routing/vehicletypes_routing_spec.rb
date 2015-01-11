require "spec_helper"

describe VehicletypesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicletypes").should route_to("vehicletypes#index")
    end

    it "routes to #new" do
      get("/vehicletypes/new").should route_to("vehicletypes#new")
    end

    it "routes to #show" do
      get("/vehicletypes/1").should route_to("vehicletypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicletypes/1/edit").should route_to("vehicletypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicletypes").should route_to("vehicletypes#create")
    end

    it "routes to #update" do
      put("/vehicletypes/1").should route_to("vehicletypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicletypes/1").should route_to("vehicletypes#destroy", :id => "1")
    end

  end
end
