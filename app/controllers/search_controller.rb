class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=80203&radius=6.0&fuel_type=ELEC,LPG")

    json = JSON.parse(response.body, symbolize_names: true)

    fuel_stations = json[:fuel_stations]

    @stations = fuel_stations.map do |station_data|
      
    binding.pry
  end
end
