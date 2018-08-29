class StationService
  def initialize(key)
    @key = key
  end

  fuel_stations = json[:fuel_stations]
  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def stations_response
    @stations_response ||= conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{@key}&location=80203&radius=6.0&fuel_type=ELEC,LPG&limit=10")
  end

  def stations_json
    JSON.parse(stations_response.body, symbolize_names: true)
  end

  def stations_hash
    stations_json[:fuel_stations]
  end
end
