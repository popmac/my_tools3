require 'rails_helper'

RSpec.describe Tool, type: :model do
  # nameがあれば有効な状態であること
  it "is valid with a name" do
    tool = Tool.new(
      name: 'Atom',
    )
    expect(tool).to be_valid
  end
end
