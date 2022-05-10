require 'rails_helper'

RSpec.describe "marvel_stories/show", type: :view do
  before(:each) do
    @marvel_story = assign(:marvel_story, MarvelStory.create!(
      description: "Description",
      attribution_text: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
  end
end
