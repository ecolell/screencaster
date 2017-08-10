require 'rails_helper'

RSpec.describe "taggings/edit", type: :view do
  before(:each) do
    @tagging = assign(:tagging, Tagging.create!(
      :tag => build(:tag),
      :episode => Episode.create!(
        :name => 'A new episode',
        :description => 'A proper description.')
    ))
  end

  it "renders the edit tagging form" do
    render

    assert_select "form[action=?][method=?]", tagging_path(@tagging), "post" do

      assert_select "input[name=?]", "tagging[tag_id]"

      assert_select "input[name=?]", "tagging[episode_id]"
    end
  end
end
