# rubocop:disable Style/Documentation

class Campaign < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :country
  belongs_to :sector
  has_many :investments, dependent: :restrict_with_error
  has_one_attached :image

  validates :name, presence: true
  validates :percentage_raised, numericality: { greater_than_or_equal_to: 0 }
  validates :target_amount, numericality: { greater_than: 0 }
  validates :investment_multiple, numericality: { greater_than: 0 }
  # validates :image, blob: { content_type: %w[image/jpg image/jpeg image/png image/webp],
  #                           size_range: 1..3.megabytes }, on: :save

  def image_file=(file)
    return if file.blank?

    image&.attach(
      io: file[:tempfile],
      filename: file[:filename],
      content_type: file[:type]
    )
  end
end
