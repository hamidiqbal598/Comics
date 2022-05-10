require 'rails_helper'

RSpec.describe "marvel_stories/edit", type: :view do
  before(:each) do
    @marvel_story = assign(:marvel_story, MarvelStory.create!(
      description: "MyString",
      attribution_text: "MyText"
    ))
  end

  it "renders the edit marvel_story form" do
    render

    assert_select "form[action=?][method=?]", marvel_story_path(@marvel_story), "post" do

      assert_select "input[name=?]", "marvel_story[description]"

      assert_select "textarea[name=?]", "marvel_story[attribution_text]"
    end
  end
end
