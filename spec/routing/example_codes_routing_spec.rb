require "spec_helper"

describe ExampleCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/example_codes").should route_to("example_codes#index")
    end

    it "routes to #new" do
      get("/example_codes/new").should route_to("example_codes#new")
    end

    it "routes to #show" do
      get("/example_codes/1").should route_to("example_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/example_codes/1/edit").should route_to("example_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/example_codes").should route_to("example_codes#create")
    end

    it "routes to #update" do
      put("/example_codes/1").should route_to("example_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/example_codes/1").should route_to("example_codes#destroy", :id => "1")
    end

  end
end
