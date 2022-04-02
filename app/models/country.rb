# rubocop:disable Style/Documentation

class Country < ApplicationRecord
  has_many :campaigns, dependent: :restrict_with_error
end
