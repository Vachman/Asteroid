require "spec_helper"

describe PhoneCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/phone_codes").should route_to("phone_codes#index")
    end

    it "routes to #new" do
      get("/phone_codes/new").should route_to("phone_codes#new")
    end

    it "routes to #show" do
      get("/phone_codes/1").should route_to("phone_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/phone_codes/1/edit").should route_to("phone_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/phone_codes").should route_to("phone_codes#create")
    end

    it "routes to #update" do
      put("/phone_codes/1").should route_to("phone_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/phone_codes/1").should route_to("phone_codes#destroy", :id => "1")
    end

  end
end
