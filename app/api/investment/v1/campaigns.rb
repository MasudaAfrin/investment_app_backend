# frozen_string_literal: true
# rubocop:disable Style/Documentation

module Investment
  module V1
    class Campaigns < Base
      resource :campaigns do
        desc 'Get all the campaigns'
        get do
          [
            {
              'id': 1
            },
            {
              'id': 2
            }
          ]
        end
      end
    end
  end
end
