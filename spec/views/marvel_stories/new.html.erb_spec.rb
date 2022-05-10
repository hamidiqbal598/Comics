require 'rails_helper'

RSpec.describe "marvel_stories/new", type: :view do
  before(:each) do
    assign(:marvel_story, MarvelStory.new(
      description: "MyString",
      attribution_text: "MyText"
    ))
  end

  it "renders new marvel_story form" do
    render

    assert_select "form[action=?][method=?]", marvel_stories_path, "post" do

      assert_select "input[name=?]", "marvel_story[description]"

      assert_select "textarea[name=?]", "marvel_story[attribution_text]"
    end
  end
end
