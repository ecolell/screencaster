require 'rails_helper'

describe Episode do
  it "validates presence of name" do
    expect(build(:episode, name: "")).to have(1).errors_on(:name)
  end

  it "validates presence of description" do
    expect(build(:episode, description: "")).to have(1).errors_on(:description)
  end

  it "scopes published episodes" do
    published = create(:episode, published_on: 2.days.ago)
    unpublished = create(:episode, published_on: 2.days.from_now)
    expect(Episode.published).to eq([published])
  end

  it "translates single digit seconds into timecode with minutes" do
    expect(create(:episode, seconds: 60*8+3).timecode).to eq('8:03')
  end

  it "translates double digit seconds into timecode with minutes" do
    expect(create(:episode, seconds: 60*8+12).timecode).to eq('8:12')
  end

  it "returns nil for timecode if seconds aren't set" do
    expect(create(:episode, seconds: nil).timecode).to be_nil
  end

  it "parses timecode into seconds" do
    expect(create(:episode, timecode: '10:03').seconds).to eq(603)
    expect(create(:episode, timecode: '').seconds).to be_nil
  end

  it "returns nil for minutes if seconds aren't set" do
    expect(create(:episode, seconds: nil).minutes).to be_nil
  end

  it "rounds the number of minutes" do
    expect(create(:episode, seconds: 60).minutes).to eq(1)
    expect(create(:episode, seconds: 91).minutes).to eq(2)
  end
end
