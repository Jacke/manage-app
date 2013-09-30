require "spec_helper"

describe SupliersController do
  describe "routing" do

    it "routes to #index" do
      get("/supliers").should route_to("supliers#index")
    end

    it "routes to #new" do
      get("/supliers/new").should route_to("supliers#new")
    end

    it "routes to #show" do
      get("/supliers/1").should route_to("supliers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supliers/1/edit").should route_to("supliers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supliers").should route_to("supliers#create")
    end

    it "routes to #update" do
      put("/supliers/1").should route_to("supliers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supliers/1").should route_to("supliers#destroy", :id => "1")
    end

  end
end
