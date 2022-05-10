require 'rails_helper'

RSpec.describe "characters/new", type: :view do
  before(:each) do
    assign(:character, Character.new(
      name: "MyString",
      marvel_story_id: 1,
      picture: nil
    ))
  end

  it "renders new character form" do
    render

    assert_select "form[action=?][method=?]", characters_path, "post" do

      assert_select "input[name=?]", "character[name]"

      assert_select "input[name=?]", "character[marvel_story_id]"

      assert_select "input[name=?]", "character[picture]"
    end
  end
end
