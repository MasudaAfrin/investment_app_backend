# frozen_string_literal: true
# rubocop:disable Style/Documentation

module Seedrs
  module V1
    class Campaigns < Base
      resource :campaigns do
        desc 'Get all the campaigns'
        params do
          use :pagination, per_page: 20
          optional :sector_id, type: Integer
          optional :country_id, type: Integer
        end
        get do
          data = if params[:sector_id].present?
                   paginate(Kaminari.paginate_array(
                              Campaign.includes(:sector, :country).search_by_sectors(params[:sector_id])))
                 elsif params[:country_id].present?
                   paginate(Kaminari.paginate_array(
                              Campaign.includes(:sector, :country).search_by_country(params[:country_id])))
                 else
                   paginate(Kaminari.paginate_array(Campaign
                                                      .includes(:sector, :country).order('campaigns.created_at desc')))
                 end
          data = Seedrs::V1::Entities::Campaigns.represent(data)
          success_response_with_json('Successfully fetched',
                                     HTTP_CODE[:OK],
                                     data)
        rescue => ex
          Rails.logger.info("unable to fetch campaign data: #{ex.message}")
          error!(failure_response_with_json('Failed to fetch campaign data', HTTP_CODE[:INTERNAL_SERVER_ERROR], []),
                 HTTP_CODE[:OK])
        end
      end
    end
  end
end
