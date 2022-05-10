require 'rails_helper'

RSpec.describe "characters/index", type: :view do
  before(:each) do
    assign(:characters, [
      Character.create!(
        name: "Name",
        marvel_story_id: 2,
        picture: nil
      ),
      Character.create!(
        name: "Name",
        marvel_story_id: 2,
        picture: nil
      )
    ])
  end

  it "renders a list of characters" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
