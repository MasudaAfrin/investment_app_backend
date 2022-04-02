require 'rails_helper'

RSpec.describe Sector, type: :model do
  it 'is not valid without a name' do
    sector = Country.new(name: nil)
    expect(sector).to_not be_valid

    sector.name = 'England'
    expect(sector).to be_valid
  end
end
