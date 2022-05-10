require 'rails_helper'

RSpec.describe "characters/edit", type: :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      name: "MyString",
      marvel_story_id: 1,
      picture: nil
    ))
  end

  it "renders the edit character form" do
    render

    assert_select "form[action=?][method=?]", character_path(@character), "post" do

      assert_select "input[name=?]", "character[name]"

      assert_select "input[name=?]", "character[marvel_story_id]"

      assert_select "input[name=?]", "character[picture]"
    end
  end
end
