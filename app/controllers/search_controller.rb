class SearchController < ApplicationController
  def index
    @stations = StationPresenter.new(ENV['API_KEY']).stations

    conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=80203&radius=6.0&fuel_type=ELEC,LPG&limit=10")

    json = JSON.parse(response.body, symbolize_names: true)

    fuel_stations = json[:fuel_stations]

    @stations = fuel_stations.map do |station_data|
      st = Station.new(station_data)
    end
  end
end
