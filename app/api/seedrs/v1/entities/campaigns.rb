# frozen_string_literal: true

module Seedrs
  module V1
    module Entities
      class Campaigns < Grape::Entity
        include Rails.application.routes.url_helpers

        expose :id
        expose :name
        expose :target_amount
        expose :percentage_raised
        expose :investment_multiple
        expose :sector_id
        expose :sector_name
        expose :country_id
        expose :country_name
        expose :image_url

        private

        def image_url
          object.image.service_url if object.image.attached?
        end
      end
    end
  end
end
