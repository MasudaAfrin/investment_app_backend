# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create country
5.times do |count|
  Country.create(name: Faker::Address.country)
end

# Create sectors
5.times do |count|
  Sector.create(name: Faker::Lorem.word)
end

50.times do |count|
  camp = Campaign.new(name: Faker::Lorem.sentence,
                      target_amount: Faker::Number.positive,
                      investment_multiple: rand(100),
                      country_id: Country.ids.sample,
                      sector_id: Sector.ids.sample)
  camp.image.attach(
    io: File.open(Rails.root.join('app', 'assets', 'campaign.jpg')),
    filename: 'campaign.jpg',
    content_type: 'image/jpg'
  )
  camp.save!
rescue => error
  p "Failed to create campaign due to #{error.message}"
end
