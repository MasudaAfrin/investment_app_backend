require 'rails_helper'

describe 'Campaigns API', type: :request do
  before do
    FactoryBot.create_list(:campaign, 30)
  end

  it 'returns all campaigns' do
    get '/api/v1/campaigns'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(20)
  end
end
