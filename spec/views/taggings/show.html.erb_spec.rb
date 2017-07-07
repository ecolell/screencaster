require 'rails_helper'

RSpec.describe "taggings/show", type: :view do
  before(:each) do
    episode = Episode.create!(name: 'episode1', description: 'A description.' )
    @tagging = assign(:tagging, Tagging.create!(
      :tag => Tag.create!(:name => 'tag3'),
      :episode => episode
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
