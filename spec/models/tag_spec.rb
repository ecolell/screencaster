require 'rails_helper'

describe Tag do
  it "validates presence of name" do
    expect(build(:tag, name: "")).to have(1).errors_on(:name)
  end

end
