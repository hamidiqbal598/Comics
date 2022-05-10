require 'rails_helper'

RSpec.describe "marvel_stories/index", type: :view do
  before(:each) do
    assign(:marvel_stories, [
      MarvelStory.create!(
        description: "Description",
        attribution_text: "MyText"
      ),
      MarvelStory.create!(
        description: "Description",
        attribution_text: "MyText"
      )
    ])
  end

  it "renders a list of marvel_stories" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
