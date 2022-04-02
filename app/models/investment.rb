# rubocop:disable Style/Documentation

class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
