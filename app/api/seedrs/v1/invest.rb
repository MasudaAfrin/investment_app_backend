# frozen_string_literal: true
# rubocop:disable Style/Documentation

module Seedrs
  module V1
    class Invest < Base
      resource :invests do
        desc 'Make an investments'
        params do
          requires :campaign_id, type: Integer
          requires :amount, type: BigDecimal
          optional :cheque_no, type: String
        end
        post do
          campaign = Campaign.find_by(id: params[:campaign_id])
          unless campaign
            error!(failure_response_with_json('Campaign not found', HTTP_CODE[:NOT_FOUND]),
                   HTTP_CODE[:OK])
          end

          unless (params[:amount] % campaign.investment_multiple).zero?
            error!(failure_response_with_json('Investment amount must be multiply of campaign multiple amount',
                                              HTTP_CODE[:UNPROCESSABLE_ENTITY]),
                   HTTP_CODE[:OK])
          end

          invest = campaign.investments.create!(amount: params[:amount],
                                                cheque_no: params[:cheque_no])
          percentage_raised = (invest.amount * 100) / campaign.target_amount
          campaign.update!(percentage_raised: percentage_raised.round(2))
          success_response_with_json('Successfully investment created',
                                     HTTP_CODE[:CREATED])
        rescue => ex
          Rails.logger.info("unable to create investment: #{ex.message}")
          error!(failure_response_with_json('Failed to create investment', HTTP_CODE[:UNPROCESSABLE_ENTITY]),
                 HTTP_CODE[:OK])
        end
      end
    end
  end
end
