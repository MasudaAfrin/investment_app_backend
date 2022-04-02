# frozen_string_literal: true

module Seedrs
  class Base < Grape::API
    include Grape::Kaminari
    include Seedrs::V1::Helpers::Constants
    helpers Seedrs::V1::Helpers::ResponseHelper

    before do
      ActiveStorage::Current.host = request.base_url
    end

    # Versioning and Formatting
    version 'v1', using: :path
    format :json
    prefix :api
    formatter :json, Grape::Formatter::Json

    # API mount
    mount V1::Campaigns
    mount V1::Invest
  end
end
