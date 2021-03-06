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

  it 'has positive target amount' do
    campaign = Campaign.new(name: 'This is a campaign',
                            percentage_raised: 0,
                            target_amount: 100,
                            investment_multiple: 1,
                            country: country,
                            sector: sector)
    expect(campaign).to be_valid

    campaign.target_amount = -1
    expect(campaign).to_not be_valid

    campaign.target_amount = 0
    expect(campaign).to_not be_valid
  end

  it 'is not valid with negative percentage_raised' do
    campaign = Campaign.new(name: 'This is a campaign',
                            percentage_raised: 0,
                            target_amount: 100,
                            investment_multiple: 1,
                            country: country,
                            sector: sector)
    expect(campaign).to be_valid

    campaign.percentage_raised = -1
    expect(campaign).to_not be_valid

    campaign.percentage_raised = 0
    expect(campaign).to be_valid
  end

  it 'should have investment multiply greater than zero' do
    campaign = Campaign.new(name: 'This is a campaign',
                            percentage_raised: 0,
                            target_amount: 100,
                            investment_multiple: 0.1,
                            country: country,
                            sector: sector)
    expect(campaign.investment_multiple).to be > 0
  end

  it 'has an image attachment' do
    campaign = Campaign.new(name: 'This is a campaign',
                            percentage_raised: 0,
                            target_amount: 100,
                            investment_multiple: 0.1,
                            country: country,
                            sector: sector)
    campaign.image.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'campaign.jpg')),
      filename: 'campaign.jpg',
      content_type: 'image/jpg'
    )
    expect(campaign.image).to be_attached
  end
end
