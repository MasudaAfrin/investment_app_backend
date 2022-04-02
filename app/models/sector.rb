# rubocop:disable Style/Documentation

class Sector < ApplicationRecord
  has_many :campaigns, dependent: :restrict_with_error

  validates :name, presence: true
end
