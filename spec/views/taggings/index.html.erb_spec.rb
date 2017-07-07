require 'rails_helper'

RSpec.describe "taggings/index", type: :view do
  before(:each) do
    episode = Episode.create!(name: 'episode1', description: 'A description.' )
    assign(:taggings, [
      Tagging.create!(
        :tag => Tag.create!(:name => 'tag1'),
        :episode => episode
      ),
      Tagging.create!(
        :tag => Tag.create!(:name => 'tag2'),
        :episode => episode
      )
    ])
  end

  it "renders a list of taggings" do
    render
    assert_select "tr>td", :text => 'tag1', :count => 1
    assert_select "tr>td", :text => 'tag2', :count => 1
  end
end
