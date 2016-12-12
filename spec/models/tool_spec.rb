require 'rails_helper'

RSpec.describe Tool, type: :model do
  # nameがあれば有効な状態であること
  it "is valid with a name" do
    tool = FactoryGirl.build(:tool)
    expect(tool).to be_valid
  end
  # nameがなければ無効な状態であること
  it "is invaild without a name" do
    tool = FactoryGirl.build(:tool, name: nil)
    tool.valid?
    expect(tool.errors[:name].size).to eq(1)
  end
end
