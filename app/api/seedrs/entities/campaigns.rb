# frozen_string_literal: true

module Seedrs
  module Entities
    class Campaigns < Grape::Entity
      expose :id
      expose :name
      expose :target_amount
      expose :percentage_raised
      expose :investment_multiple
    end
  end
end
