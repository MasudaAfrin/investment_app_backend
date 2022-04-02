require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'is not valid without a name' do
    country = Country.new(name: nil)
    expect(country).to_not be_valid

    country.name = 'England'
    expect(country).to be_valid
  end
end
