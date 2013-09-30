require "spec_helper"

describe NexusesController do
  describe "routing" do

    it "routes to #index" do
      get("/nexuses").should route_to("nexuses#index")
    end

    it "routes to #new" do
      get("/nexuses/new").should route_to("nexuses#new")
    end

    it "routes to #show" do
      get("/nexuses/1").should route_to("nexuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nexuses/1/edit").should route_to("nexuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nexuses").should route_to("nexuses#create")
    end

    it "routes to #update" do
      put("/nexuses/1").should route_to("nexuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nexuses/1").should route_to("nexuses#destroy", :id => "1")
    end

  end
end
