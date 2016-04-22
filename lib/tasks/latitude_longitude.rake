namespace :coordinates do
  desc "calculate coordinates"
  task calculate_coordinates: :environment do
    users = User.all
    users.each do |user|
      coordinates = Geocoder.coordinates(user.address)
      user.latitude = coordinates[0]
      user.longitude = coordinates[1]
      user.save
    end
  end
end
