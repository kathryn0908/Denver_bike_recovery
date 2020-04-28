require 'rest-client'
require 'pry'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_zipcodes
    response = RestClient.get("https://bikewise.org/api/v2/incidents?per_page=50&occurred_after=2018&incident_type=theft&proximity=Denver%2C%20CO&proximity_square=50")
    bikedata = JSON.parse(response)
    bikes = bikedata["incidents"]

    addresses = bikes.map do |bike|
        bike["address"]
    end

    zipcodes = addresses.map do |address|
        {
            zipcode: address.split(", ")[2],
            city: address.split(", ")[0]
        }
    end

    zips = zipcodes.select do |zip|
        zip[:zipcode] != nil
    end.uniq

    zips.each do |zip|
        binding.pry
        Zipcode.create(zipcode: zip[:zipcode].to_i, city: zip[:city])
    end

end

def get_bikes
    response = RestClient.get("https://bikewise.org/api/v2/incidents?per_page=50&occurred_after=2018&incident_type=theft&proximity=Denver%2C%20CO&proximity_square=50")
    bikedata = JSON.parse(response)
    bikes = bikedata["incidents"]
    new_bike_data = bikes.map do |bike|
        {
            title: bike["title"],
            description: bike["description"],
            image: bike["media"]["image_url"],
            occurred_at: bike["occurred_at"],
            address: bike["address"]
        }
    end
    # binding.pry
end

get_zipcodes
get_bikes