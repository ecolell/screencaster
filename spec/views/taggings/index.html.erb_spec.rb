require 'rails_helper'

RSpec.describe "taggings/index", type: :view do
  before(:each) do
    assign(:taggings, [
      Tagging.create!(
        :tag => nil,
        :episode => nil
      ),
      Tagging.create!(
        :tag => nil,
        :episode => nil
      )
    ])
  end

  it "renders a list of taggings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
