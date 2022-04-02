# frozen_string_literal: true
# rubocop:disable Style/Documentation

module Seedrs
  module V1
    class Campaigns < Base
      resource :campaigns do
        desc 'Get all the campaigns'
        params do
          use :pagination, per_page: 20
        end
        get do
          campaigns = paginate(Kaminari.paginate_array(Campaign
            .includes(:sector, :country).order('campaigns.created_at desc')))
          present campaigns, with: Seedrs::Entities::Campaigns
        rescue => ex
          Rails.logger.error("Unable to show due to #{ex.message}", status: :ok)
        end
      end
    end
  end
end
