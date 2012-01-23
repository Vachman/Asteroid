require "spec_helper"

describe DirectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/directions").should route_to("directions#index")
    end

    it "routes to #new" do
      get("/directions/new").should route_to("directions#new")
    end

    it "routes to #show" do
      get("/directions/1").should route_to("directions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/directions/1/edit").should route_to("directions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/directions").should route_to("directions#create")
    end

    it "routes to #update" do
      put("/directions/1").should route_to("directions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/directions/1").should route_to("directions#destroy", :id => "1")
    end

  end
end
