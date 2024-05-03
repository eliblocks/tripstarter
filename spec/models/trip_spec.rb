require 'rails_helper'

RSpec.describe Trip do
  it 'has a valid factory' do
    expect(build(:trip)).to be_valid
  end
end
