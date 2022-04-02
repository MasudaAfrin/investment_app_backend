# rubocop:disable Style/Documentation

class Campaign < ApplicationRecord
  belongs_to :country
  belongs_to :sector
  has_many :investments, dependent: :restrict_with_error
  has_one_attached :image

  validates :image, blob: { content_type: %w[image/jpg image/jpeg image/png image/webp],
                            size_range: 1..3.megabytes }, on: :save

  def image_file=(file)
    return if file.blank?

    image&.attach(
      io: file[:tempfile],
      filename: file[:filename],
      content_type: file[:type],
      )
  end
end
