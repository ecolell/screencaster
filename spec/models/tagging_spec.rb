require 'rails_helper'

describe Tagging do
  before(:each) do
    @tagging = Tagging.create!(
      :tag => build(:tag),
      :episode => build(:episode))
  end

  it "validates presence of episode_id" do
    @tagging.episode = nil
    expect(@tagging).to have(1).errors_on(:episode)
  end

  it "validates presence of tag_id" do
    @tagging.tag = nil
    expect(@tagging).to have(1).errors_on(:tag)
  end
end
