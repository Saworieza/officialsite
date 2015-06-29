require "rails_helper"

RSpec.describe MembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/members").to route_to("members#index")
    end

    xit "routes to #new" do
      expect(:get => "/members/new").to route_to("members#new")
    end

    it "routes to #show" do
      expect(:get => "/members/1").to route_to("members#show", :id => "1")
    end

    xit "routes to #edit" do
      expect(:get => "/members/1/edit").to route_to("members#edit", :id => "1")
    end

    xit "routes to #create" do
      expect(:post => "/members").to route_to("members#create")
    end

    xit "routes to #update" do
      expect(:put => "/members/1").to route_to("members#update", :id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/members/1").to route_to("members#destroy", :id => "1")
    end

  end
end
