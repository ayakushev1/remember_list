require "spec_helper"

describe RemembersController do
  describe "routing" do

    it "routes to #index" do
      get("/remembers").should route_to("remembers#index")
    end

    it "routes to #new" do
      get("/remembers/new").should route_to("remembers#new")
    end

    it "routes to #show" do
      get("/remembers/1").should route_to("remembers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/remembers/1/edit").should route_to("remembers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/remembers").should route_to("remembers#create")
    end

    it "routes to #update" do
      put("/remembers/1").should route_to("remembers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/remembers/1").should route_to("remembers#destroy", :id => "1")
    end

  end
end
