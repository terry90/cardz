require "rails_helper"

RSpec.describe OfferReductionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/offer_reductions").to route_to("offer_reductions#index")
    end

    it "routes to #new" do
      expect(:get => "/offer_reductions/new").to route_to("offer_reductions#new")
    end

    it "routes to #show" do
      expect(:get => "/offer_reductions/1").to route_to("offer_reductions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/offer_reductions/1/edit").to route_to("offer_reductions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/offer_reductions").to route_to("offer_reductions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/offer_reductions/1").to route_to("offer_reductions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/offer_reductions/1").to route_to("offer_reductions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/offer_reductions/1").to route_to("offer_reductions#destroy", :id => "1")
    end

  end
end
