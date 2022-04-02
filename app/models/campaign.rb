class Campaign < ApplicationRecord
  belongs_to :country
  belongs_to :sector
  has_many :investments, dependent: :restrict_with_error
end
