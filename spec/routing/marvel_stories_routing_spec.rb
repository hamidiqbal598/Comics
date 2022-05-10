require "rails_helper"

RSpec.describe MarvelStoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/marvel_stories").to route_to("marvel_stories#index")
    end

    it "routes to #new" do
      expect(get: "/marvel_stories/new").to route_to("marvel_stories#new")
    end

    it "routes to #show" do
      expect(get: "/marvel_stories/1").to route_to("marvel_stories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/marvel_stories/1/edit").to route_to("marvel_stories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/marvel_stories").to route_to("marvel_stories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/marvel_stories/1").to route_to("marvel_stories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/marvel_stories/1").to route_to("marvel_stories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/marvel_stories/1").to route_to("marvel_stories#destroy", id: "1")
    end
  end
end
