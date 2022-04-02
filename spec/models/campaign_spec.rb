require 'rails_helper'

RSpec.describe Campaign, type: :model do
  country = Country.first_or_create!(name: 'Bangladesh')
  sector = Sector.first_or_create!(name: 'Education')

  it 'is not valid without a name' do
    campaign = Campaign.new(name: nil,
                            percentage_raised: 0,
                            target_amount: 1000,
                            investment_multiple: 1,
                            country: country,
                            sector: sector)
    expect(campaign).to_not be_valid

    campaign.name = 'This is first campaign'
    expect(campaign).to be_valid
  end

  
end
