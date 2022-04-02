# frozen_string_literal: true

module Seedrs
  class Base < Grape::API
    # Versioning and Formatting
    version 'v1', using: :path
    format :json
    prefix :api
    formatter :json, Grape::Formatter::Json

    # API mount
    mount V1::Campaigns
  end
end
